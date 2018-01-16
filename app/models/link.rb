class Link < ApplicationRecord
  before_save :build_short_url, on: :create
  before_save { long_url.downcase! }

  validate :not_a_shortening_service
  validates :long_url,
            format: { with: /\A#{URI::regexp(['http', 'https'])}\z/,
                      message: "Invalid URL format" },
            presence: true
  validates :short_url,
            uniqueness: true,
            length: { maximum: 20, minimum: 1 },
            allow_blank: true,
            format: { without: /\Alinks\z/ }

  private

  def generate_short_code
    SecureRandom.urlsafe_base64(5).downcase!
  end

  def build_short_url
    if short_url.blank?
      short_code = generate_short_code
      short_code = generate_short_code while Link.where(short_url: short_code).exists?
      self.short_url = short_code
    else
      self.is_custom_url = true
      short_url.downcase!
    end
  end

  OTHER_SHORTENERS = ["goo.gl", "bit.ly"].freeze
  def not_a_shortening_service
    begin
      url = URI.parse(long_url)
    rescue URI::InvalidURIError
      return false
    end
    errors.add(:long_url_error, "- shortening service not allowed in long URL") if OTHER_SHORTENERS.include?(url.host)
  end
end
