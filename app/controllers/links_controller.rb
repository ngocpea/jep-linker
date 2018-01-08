class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    long_url = params[:link][:long_url]
    existing_link = Link.where(long_url: long_url).first
    if existing_link
      render plain: "Your short link is #{existing_link.short_url}"
    else
      link = Link.new(long_url: long_url)
      link.valid?
      return flash[:alert] = "please enter your link" if link.errors[:long_url].any?
      link.create_short_url
      until link.save
        link.create_short_url
      end
      render plain: "Your link has been shortened. Your short link is #{link.short_url}"
    end
  end
end
