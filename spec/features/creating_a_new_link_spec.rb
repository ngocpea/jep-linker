require 'rails_helper'

RSpec.feature "Creating a new link" do
  scenario "successfully creates a new link" do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    link = Link.first
    expect(page).to have_content("Short link successfully created www.linker/#{link.short_url}")
  end

  scenario "when a user enters no URL they should see an error message" do
    visit "/"
    click_button "Shorten"
    expect(page).to have_content("Please enter your link")
  end
end
