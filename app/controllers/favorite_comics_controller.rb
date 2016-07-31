class FavoriteComicsController < ApplicationController
  before_action :set_comic

  def create
    if Favorite.create(favorited: @comic, user: current_user)
      redirect_to @comic, notice: 'Comic has been favorited'
    else
      redirect_to @comic, alert: 'Something went wrong!'
    end
  end

  def destroy
    Favorite.where(favorited_id: @comic.id, user_id: current_user.id).first.destroy
    redirect_to @comic, notice: 'Comic is no longer in favorites'
  end

  private

  def set_comic
    @comic   = Comic.find(params[:comic_id] || params[:id] || params[:format])
  end
end
