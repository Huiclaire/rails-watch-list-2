class Bookmark < ApplicationRecord
  belongs_to :movie
  # allow us to do: @bookmark.movie
  belongs_to :list

  # validates :list_id, presence: true
  # a movie can only show up once in every list
  validates :movie, uniqueness: { scope: :list_id, message: "is already in the list"}
  validates :comment, length: { minimum: 6 }
  validates_presence_of :list
end
