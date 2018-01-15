require 'uri/http'

class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    long_url = params[:link][:long_url]
    user_chosen_short_url = params[:link][:short_url]
    render plain: CreateLink.short_link_from_existing_link(long_url, user_chosen_short_url)
  end

  def show
    short_url = params[:short_url]
    link = Link.where(short_url: short_url).first
    url = Addressable::URI.heuristic_parse(link.long_url)
    redirect_to url.to_s
  end
end
