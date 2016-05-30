class ComicsController < ApplicationController
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
  end

  def update

  end

  def delete

  end
end
