require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:long_url) { "cultureamp.com" }
  subject(:cultureamp) { Link.create!(long_url: long_url) }

  it "generates a short URL using id" do
    expect(cultureamp.short_url).to be_present
  end

  it "does not create a new link object" do
    Link.create!(long_url: long_url)
    link = Link.create(long_url: long_url)
    expect(link).to_not be_valid
    expect(link.errors[:long_url]).to eq(["has already been taken"])
  end
end
