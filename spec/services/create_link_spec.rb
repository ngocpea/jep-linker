require 'rails_helper'

RSpec.describe CreateLink do
  it "should create a link" do
    create_link = CreateLink.new
    link = create_link.create_new_link('www.facebook.com', '')
    expect(link).to be_valid
  end

  it "should return an invalid link when passed an empty string" do
    create_link = CreateLink.new
    link = create_link.create_new_link('', '')
    expect(link).to_not be_valid
  end
end
