class Link < ApplicationRecord
  validates :long_url, presence: true
  validates_uniqueness_of  :long_url
  
  def to_param
    short_url
  end
end
