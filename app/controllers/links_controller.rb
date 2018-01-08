class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def create
    link = Link.find_or_initialize_by(long_url: params[:long_url])
    if link.persisted?
      render plain: "Your link has been shortened. Your short link is #{link}"
      return
    end

    if link.save
      render plain: "Your link has been successfully saved"
    else
      render plain: "Failed to save - please enter your link"
    end

    # link = Link.create(long_url: params[:long_url])
    # render plain: "Your link has been shortened. Your short link is #{link.long_url}"
  end
end
