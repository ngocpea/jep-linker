require 'rails_helper'
require 'base64'

RSpec.describe Link, type: :model do
  it "should create a short url for the long_link" do
    link = Link.new(long_url: "www.facebook.com", id: 123)
    link.create_uniq_short_url
    expect(link.short_url).to be_present
  end

  it "should produce a new url each time" do
    Link.create(long_url: 'http://www.something.com', short_url: "abc123")
    new_link = Link.create(long_url: 'www.something.com', short_url: "abc123")
    expect(new_link.valid?).to be false
    expect(new_link.errors[:short_url]).to eq(["has already been taken"])
  end
end
