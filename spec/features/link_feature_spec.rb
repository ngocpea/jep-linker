require 'rails_helper'

RSpec.feature "Creating a new link" do
  scenario "successfully creates a new link" do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    expect(page).to have_content("Your link has been shortened.")
    link = Link.first
    expect(page).to have_content("Your short link is #{link.short_url}")
  end
end

RSpec.feature "When entering an entering an existing link" do
  scenario "returns the corresponding short url" do
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    visit "/"
    fill_in "Long URL", with: "http://ryanbigg.com/2016/04/hiring-juniors"
    click_button "Shorten"
    link = Link.where(long_url: "http://ryanbigg.com/2016/04/hiring-juniors")
    expect(link.count).to eq(1)
    expect(page).to have_content("Your short link is #{link.first.short_url}")
  end
end
