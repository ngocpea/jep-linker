class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    link = Link.find_or_initialize_by(long_url: params[:link][:long_url])
    if link.persisted?
      render plain: "Your link is alredy exist and short link is #{link.short_url}"
      return
    end

    if link.save
      render plain: "Your link is create and short link is #{link.short_url}"
      link.save!
    else
      render plain: "Failed to save - please enter your link"
    end
  end
end
