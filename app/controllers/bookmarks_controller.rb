class BookmarksController < ApplicationController
  before_action :set_movie, only: %i[new create]

  def new
    set_movie
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @bookmark.save
    redirect_to lists_path(@list)
  end

  # def destroy

  # end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:list_id)
  end

end
