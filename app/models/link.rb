class Link < ApplicationRecord
  # do I still need to add validation helpers here if already using find_or_create_by method?
  #attr_reader :short_url
  validates :long_url, uniqueness: true, presence: true

  def shorten_url
    short_url = "http://short.ly/" + id.to_s(16)
  end
end
