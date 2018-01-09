class LinksController < ApplicationController
  include Services
  def index
    @link = Link.new
    @shortened_link = Link.find_by_short_url(params[:id])
  end

  def show
  end

  def create
    @link = Services::Url.find_or_create(long_url: params[:link][:long_url])
    if @link.valid? 
      redirect_to links_path(id: @link)
    else
      flash[:notice] = "URL is invalid"
      redirect_to root_path
    end
  end
end
