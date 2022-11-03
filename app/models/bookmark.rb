class Bookmark < ApplicationRecord
  belongs_to :movie
  # allow us to do: @bookmark.movie
  belongs_to :list

  # validates :list_id, presence: true
  # a movie can only show up once in every list
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in the list"}
end
