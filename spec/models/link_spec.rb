require 'rails_helper'
require 'base64'

RSpec.describe Link, type: :model do
  it "should create an ID for the long_link" do
    link = Link.new(long_url: "www.facebook.com", id: 123)
    link.create_uniq_short_url
    expect(link.short_url).to be_present
  end

  it "should produce a new url each time" do
    Link.create(long_url: 'www.something.com', short_url: "abc123")
    link2 = Link.create(long_url: 'www.something.com', short_url: "abc123")
    expect(link2.valid?).to be false
    expect(link2.errors[:short_url]).to eq(["has already been taken"])
  end
end
