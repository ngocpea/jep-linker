class LinksController < ApplicationController
  def index
  end

  def create
    existing_link = Link.where(long_url: params[:long_url]).first
    if existing_link
      render plain: "Your short link is #{existing_link.short_url}"
    else
      link = Link.new(long_url: params[:long_url])
      link.valid?
      return render plain: "please enter your link" if link.errors[:long_url].any?
      link.create_short_url
      until link.save
        link.create_short_url
      end
      render plain: "Your link has been shortened. Your short link is #{link.short_url}"
    end
  end
end
