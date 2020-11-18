class Api::V1::LinksController < ApplicationController
  def show
    if @link = Link.find_by(short_key: params[:id])
      render json: response_data, status: :ok
    else
      render json: {error: "Link not found"}, status: :not_found
    end
  end

  def create
    @link = Link.create_short_link link_params[:url]
    render json: response_data, status: :ok
  end

  private
  def link_params
    params.require(:link).permit :url
  end

  def response_data
    {
      link: {
        url: @link.url,
        short_key: @link.short_key
      }
    }
  end
end
