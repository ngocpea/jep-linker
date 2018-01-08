require 'rails_helper'

RSpec.describe CreateLink do
  it "should create a link" do
    create_link = CreateLink.new
    expect(create_link.create_new_link('www.facebook.com')).to include("Your link has been shortened. Your short link is")
  end

  it "should return an error message when passed an empty string" do
    create_link = CreateLink.new
    expect(create_link.create_new_link('')).to eq("please enter your link")
  end
end
