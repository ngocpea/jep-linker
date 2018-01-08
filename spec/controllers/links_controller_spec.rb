require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  it "can create a link successfully" do
    post :create, params: { link: { long_url: "google.com" } }
    link = Link.find_by(long_url: "google.com")
    expect(link).to be_present
    expect(response).to redirect_to(link_path(link))
  end

  it "shows a link" do
    post :create, params: { link: { long_url: "google.com" } }
    link = Link.find_by(long_url: "google.com")
    get :show, params: { id: link.id }
    expect(response).to be_success
  end
end
