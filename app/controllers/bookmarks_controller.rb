class BookmarksController < ApplicationController
  before_action :set_movie, only: %i[new create]

  def new
    set_movie
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
