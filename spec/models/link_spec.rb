require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:valid_url) { "cultureamp.com" }

  before do
    @cultureamp = Link.create!(long_url: valid_url)
  end

  it "generates a short URL using id" do
    expect(@cultureamp.short_url).to be_present
  end

  it "does not create a new link object" do
    dup_link = Link.create(long_url: valid_url)
    expect(dup_link).to_not be_valid
    expect(dup_link.errors[:long_url]).to eq(["has already been taken"])
  end

  it "does not accept invalid URLs" do
    skip
    invalid_link = Link.create(long_url: "foobar")
  end
end
