class Link < ApplicationRecord
  validates :long_url, presence: true, url: true
  validates :short_url, uniqueness: true

  def create_uniq_short_url
    self.short_url = create_short_url
    if Link.where(short_url: short_url).exists?
      create_uniq_short_url
    end
  end

  def user_create_uniq_short_url(short_url)
    self.short_url = short_url
  end

  def to_param
    short_url
  end

  private

  def create_short_url
    SecureRandom.urlsafe_base64(4)
  end
end
