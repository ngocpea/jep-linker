class Link < ApplicationRecord
  before_save :build_short_url, on: :create
  before_save { long_url.downcase! }

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
end
