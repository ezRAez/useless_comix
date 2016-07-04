class ComicsController < ApplicationController
  before_action :admit_admin!, except: [:index, :show]

  def index
    @comics = Comic.all
  end

  def show
    last_id = params[:id] || Comic.last.id
    @comic = Comic.find(last_id)
  end

  def new
    @comic = Comic.new
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to root_path, notice: "Comic added!"
    else
      render 'new', alert: "Could not add comic."
    end
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(comic_params)
      redirect_to comic_path, notice: 'Comic updated!'
    else
      render 'edit', alert: "Could not update comic."
  end

  def delete
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to comics_path, notice: "Comic deleted."
  end

  private

  def comic_params
    params.require(:comics).permit(:name, :uri)
  end
end
