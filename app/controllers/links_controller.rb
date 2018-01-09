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
      render plain: CreateLink.new.create_new_link(long_url)
    end
  end

  def show
    short_url = params[:short_url]
    link = Link.where(short_url: short_url).first
    redirect_to link.long_url
  end
end
