class LinksController < ApplicationController
  def index
  end

  def create
    link = Link.find_or_create_by(link_params)
    render plain: "Your link has been shortened. Your short link is #{link.short_url}"
  end

  private

  def link_params
    params.permit(:long_url)
  end
end
