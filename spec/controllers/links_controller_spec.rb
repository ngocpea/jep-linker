require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  # it "takes valid input" ???
  it "returns stored short url if long url already exists" do
    expect(Link.find_by(long_url: "http://adjustment.example.com/battle")).to #be in the database
  end
  # it "makes a short url from a long url"
  # it "stores both urls in database"  <----- goes in model_spec??
end