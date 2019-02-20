class Api::V1::CaptionsController < ApplicationController
  def index
    @captions = Caption.all
    render json: @captions
  end

  def new
    @caption = Caption.new
    render json: @caption, status: :ok

  end

  def create
    @caption = Caption.create(caption_params)
  end

  def show
    @caption = Caption.find(params[:id])
    render json: @caption
  end

  def destroy
    @caption = Caption.find(params[:id])
    @caption.destroy

  end

  private

  def caption_params
    params.require(:caption).permit(:id, :text, :user_id)

  end



end
