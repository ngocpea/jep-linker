class Link < ApplicationRecord
  before_save :build_short_url, on: :create
  before_save { long_url.downcase! }

  validate :not_a_shortening_service
  validates :long_url, presence: true
  validates :short_url,
            uniqueness: true,
            length: { maximum: 20, minimum: 1 },
            allow_blank: true

  def build_short_url
    if short_url.blank?
      self.short_url = SecureRandom.urlsafe_base64(5).downcase!
    else
      short_url.downcase!
      self.is_custom_url = true
    end
  end

  def not_a_shortening_service
    return if self.long_url.blank?

    temp_url = self.long_url
    temp_url = "http://#{temp_url}" if URI.parse(temp_url).scheme.nil?

    if URI.parse(temp_url).host.downcase == "goo.gl" || URI.parse(temp_url).host.downcase == "bit.ly"
      errors.add(:long_url_error, "Shortening service not allowed in long URL")
    end
  end
end
