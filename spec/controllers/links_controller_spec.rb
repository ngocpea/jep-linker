require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  it "can create a link successfully" do
    post :create, params: { long_url: "google.com" }
    expect(response).to be_success
    link = Link.find_by(long_url: "google.com")
    expect(link).to be_present
    expect(response.body).to eq("Your link has been shortened. Your short link is #{link.short_url}")
  end
end
