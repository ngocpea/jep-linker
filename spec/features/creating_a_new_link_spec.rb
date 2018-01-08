
require 'rails_helper'

RSpec.feature "Creating a new link" do
  scenario "displays error when no link is provided" do
    visit "/"
    click_button "Create Link"
    expect(page).to have_content("Failed to save - please enter your link")
  end
end
