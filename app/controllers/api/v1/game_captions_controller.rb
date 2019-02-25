class Api::V1::GameCaptionsController < ApplicationController
  def index
    @gameCaptions = GameCaption.all
    render json: @gameCaptions
  end

  def new
    @gameCaption = GameCaption.new
  end

  def create
    @gameCaption = GameCaption.create(game_caption_params)
    render json: @gameCaption, status: :ok
  end

  def show
    @gameCaption = GameCaption.find(params[:id])
    render json: @gameCaption
  end


  def edit
    @gameCaption = GameCaption.find(params[:id])
    render json: @gameCaption
  end

  def update
    @gameCaption = GameCaption.find(params[:id])
    @gameCaption.update(game_caption_params)
    render json: @gameCaption, status: :ok
  end

  private

  def game_caption_params
    params.require(:game_caption).permit(:id, :game_id, :caption_id, :points)
  end



end
