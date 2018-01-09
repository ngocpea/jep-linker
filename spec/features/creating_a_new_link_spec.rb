require 'rails_helper'
require 'capybara/dsl'

RSpec.feature "Creating a new link" do
  before do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
  end

  scenario "successfully creates a new link" do
    link = Link.first
    find_link("http://www.linker/#{link.short_url}").visible?
  end

  scenario "when a user enters no URL they should see an error message" do
    visit "/"
    click_button "Shorten"
    assert_selector "#notice", text: "URL is invalid" 
  end

  scenario "when user clicks short link, they should be redirected back to long link", js: true do
    link = Link.first
    click_link "http://www.linker/#{link.short_url}"
    expect(page).to have_current_path(link.long_url)
  end
end
