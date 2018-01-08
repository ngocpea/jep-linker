class Link < ApplicationRecord
  validates :long_url, presence: true
  validates_uniqueness_of  :long_url
  
  def shorten_url
  end
end
