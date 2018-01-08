require 'rails_helper'

RSpec.feature "Creating a new link" do
  scenario "successfully creates a new link" do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    link = Link.last
    expect(page).to have_content("Your short url is http://short.ly/#{link.short_url}")
  end

  scenario "shows error message if no link submitted" do
    visit "/"
    click_button "Shorten"
    expect(page).to have_content("Long url can't be blank")
  end
end
