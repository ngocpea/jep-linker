class Link < ApplicationRecord
  before_save :build_short_url, on: :create
  before_save { long_url.downcase! }
  before_save { short_url.downcase! }

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
      while Link.where(short_url: short_code).exists?
        short_code = generate_short_code
      end
      self.short_url = short_code
    else
      self.is_custom_url = true
    end
  end
end
