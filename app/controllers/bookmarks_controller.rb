class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_movie, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to movie_path(@bookmark.movie), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
