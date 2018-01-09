class Link < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, uniqueness: true

  def create_uniq_short_url
    self.short_url = create_short_url
    if Link.where(short_url: short_url).exists?
      create_uniq_short_url
    end
  end

  private

  def create_short_url
    SecureRandom.urlsafe_base64(4)
  end
end
