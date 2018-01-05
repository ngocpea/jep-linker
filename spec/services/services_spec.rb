require 'spec_helper'

RSpec.describe Services::Url do
  long_url = "https://www.config.com"
  before(:each) do
    @url_shortener = described_class
  end
  describe "Url" do
    context "given a long url" do
      it "provides a shorter URL" do
        url_length = long_url.length
        expect(@url_shortener.find_or_create(long_url: long_url).short_url.length).to be < url_length
      end
    end
  end
end
