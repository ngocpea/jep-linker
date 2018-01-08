class LinksController < ApplicationController
  include Services
  def index
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    @link = Services::Url.find_or_create(long_url: params[:link][:long_url])
    if @link.valid? 
      @shortened_link = "Your short link is #{@link.short_url}"
      redirect_to link_path(@link) 
      flash[:notice] = "Short link successfully created"
    else
      render plain: "Please enter your link"
    end
  end
end
