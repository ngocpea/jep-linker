class LinksController < ApplicationController
  include Services
  def index
  end

  def create
    @link = Services::Url.find_or_create(long_url: params[:long_url])
    render plain: "Your short link is #{@link.short_url}"
  end
end
