require 'rails_helper'
require 'capybara/dsl'

RSpec.feature "Creating a new link" do
  before(:context) do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    #link = Link.first
  end
    scenario "successfully creates a new link" do
    # visit "/"
    # fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    # click_button "Shorten"
    link = Link.first
    expect(page).to have_content("Short link successfully created #{link.short_url}")
  end

  scenario "when a user enters no URL they should see an error message" do
    visit "/"
    click_button "Shorten"
    expect(page).to have_content("Please enter your link")
  end

  scenario "when user clicks short link, the should be redirected back to long link", js: true do
    link = Link.first
    visit "/links/#{link.id}"
    click_link "#{link.short_url}"
    expect(page).to have_current_path(link.long_url)
  end
end
