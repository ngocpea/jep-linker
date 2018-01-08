class Link < ApplicationRecord
  validates :long_url, uniqueness: true, presence: true

  def short_url
    self.short_url = id.to_s(16)
  end
end
