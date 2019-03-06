class Api::V1::GameCaptionsController < ApplicationController
  def index
    @gameCaptions = GameCaption.all
    render json: @gameCaptions
  end

  def new
    @gameCaption = GameCaption.new
  end

  def create
    @gameCaption = GameCaption.new(game_caption_params)

    if @gameCaption.save
      ActionCable.server.broadcast("home_channel", {type: 'ADDED_CAPTION', gameCaption: GameCaptionSerializer.new(@gameCaption)})
      render json: GameCaptionSerializer.new(@gameCaption), status: :ok
    else
      render json: {errors: game_caption.errors}, status: 422
    end
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
    ActionCable.server.broadcast("home_channel", {type: 'ADD_POINTS', gameCaption: GameCaptionSerializer.new(@gameCaption)})
    render json: GameCaptionSerializer.new(@gameCaption), status: :ok
  end

  private

  def game_caption_params
    params.require(:game_caption).permit(:id, :game_id, :caption_id, :points)
  end



end
