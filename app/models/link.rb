class Link < ApplicationRecord
  validates :long_url, uniqueness: true, presence: true
  def short_url
    id.to_s(36)
  end
end
