class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    if link_params[:long_url].blank? && link_params[:short_url].blank?
      render plain: "Failed to save - please enter your link"
      return
    end

    if link_params[:short_url].blank?
      link = Link.find_by(long_url: link_params[:long_url])
      if link
        render plain: "Your link ALREADY EXISTS and is #{link.short_url}"
        return
      end

      @link = Link.new(long_url: link_params[:long_url])
      if @link.save
        @link.shorten_url
        @link.save!
        render plain: "Your link is CREATED: #{@link.short_url}"
        return
      else
        flash.now[:alert] = "Your link could not be saved"
        render :new
        return
      end
    end

    if link_params[:long_url] && link_params[:short_url]
      @link = Link.new(long_url: link_params[:long_url], short_url: link_params[:short_url])
      if @link.save
        flash[:notice] = "Your link was saved successfully"
        redirect_to @link
      else
        flash.now[:alert] = "Your link could not be saved"
        render :new
      end
    end
  end

  def redirect
    @link = Link.find_by(short_url: params[:short_url])
    redirect_to Addressable::URI.heuristic_parse(@link.long_url).to_s
  end
end

private

def link_params
  params.require(:link).permit(:long_url, :short_url)
end
