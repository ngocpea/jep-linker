class LinksController < ApplicationController
  def index
  end

  def create
    link = Link.new(long_url: params[:long_url])
    link.create_short_url
    # binding.pry
    link.save
    render plain: "Your link has been shortened. Your short link is #{link.short_url}"
  end
end
