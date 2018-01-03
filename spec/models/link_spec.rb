require 'rails_helper'

RSpec.describe Link, type: :model do
  it "generates a short URL using id" do
    link = Link.create(long_url: "google.com")
    expect(link.short_url).to be_present
  end

  it "raises exception if URL already exists" do
    Link.create!(long_url: "google.com")
    expect { Link.create!(long_url: "google.com") }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
