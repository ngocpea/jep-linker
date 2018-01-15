class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = find_or_create(link_params)
    if @link.valid?
      redirect_to @link
    else
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def forward
    @link = Link.find_by(short_url: params[:short_url])
    redirect_to @link.long_url
  end

  private

  def link_params
    params.require(:link).permit(:long_url, :short_url)
  end

  def find_or_create(link_params)
    long_url = format_long_url(link_params[:long_url])
    link = Link.find_by(long_url: long_url, is_custom_url: false)
    link || Link.create(short_url: link_params[:short_url], long_url: long_url)
  end

  def format_long_url(long_url)
    Addressable::URI.heuristic_parse(long_url.gsub(/www./, '')).to_s
  end
end
