require 'spec_helper'

RSpec.describe Services::Url do
  long_url = "https://www.config.com"
  before(:each) do
    @url_shortener = described_class
    @url = "www.google.com"
    @shortened_url = @url_shortener.set_url(url: @url)
  end

  describe "Url" do
    context "given a long url" do
      it "provides a shorter URL" do
        url_length = long_url.length
        expect(@url_shortener.find_or_create(long_url: long_url).short_url.length).to be < url_length
      end
    end

    describe "set_url" do
      it "adds http scheme to user input" do
        expect(@shortened_url.scheme).to eq("http")
      end

      it "includes hostname in shortened url" do
        expect(@shortened_url.host).to eq('www.google.com')
      end

      it "has no path is none is entered" do
        expect(@shortened_url.path).to eq('')
      end
    end
    describe "build_url_string" do
      it "builds full path as string" do
        expect(@url_shortener.build_url_string(@shortened_url)).to eq("http://www.google.com")
      end
    end
  end
end
