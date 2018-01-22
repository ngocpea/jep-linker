require 'uri/http'

class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    long_url = params[:link][:long_url]
    user_chosen_short_url = params[:link][:short_url]
    @link = CreateLink.short_link_from_existing_link(long_url, user_chosen_short_url)
    if @link.save
      flash.now[:notice] = "Your link was shortened to: #{@link.short_url}"
      redirect_to action: "show", id: @link.id # why not @link??
    else
      flash.now[:alert] = "Link could not be created."
      render :index
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def forward
    short_url = params[:short_url]
    link = Link.find_by(short_url: short_url)
    redirect_to link.long_url.to_s
  end
end
