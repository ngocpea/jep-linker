require 'rails_helper'

RSpec.describe CreateLink do
  describe '#create_new_link' do
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

  describe '.short_link_from_exixting_link' do
    it "should create a link" do
      link = CreateLink.short_link_from_existing_link("ryanbigg.com/something", "dottest")
      expect(link).to be_valid
    end

    context "when the user_chosen_short_url contains a period" do
      it "should create a link" do
        link = CreateLink.short_link_from_existing_link("ryanbigg.com/something", "dot.test")
        expect(link).to be_valid
      end
    end
  end
end
