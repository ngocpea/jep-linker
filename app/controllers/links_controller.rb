class LinksController < ApplicationController
  def index
  end

  def create
    link = Link.create(long_url: params[:long_url])
    render plain: "Your link has been shortened. Your short link is #{link.long_url}"
  end
end
