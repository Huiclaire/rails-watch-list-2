class BookmarksController < ApplicationController
  before_action :set_movie
  def new
    set_movie
    @bookmark = Bookmark.new
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
