require 'rails_helper'

RSpec.feature "Creating a new link" do
  scenario "successfully creates a new link" do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    expect(page).to have_content("Your short link is short.ly/1")
  end

  scenario "doesn't create duplicated entries" do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    expect(page).to have_content("Your short link is short.ly/1")
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    expect(page).to_not have_content("Your short link is short.ly/2")
  end
end