class Link < ApplicationRecord

  validates :short_url, uniqueness: true
  def create_short_url
    self.short_url ||= SecureRandom.urlsafe_base64(4)
  end
end
