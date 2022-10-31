class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # a movie can only show up once in every list
  validates_uniqueness_of :movie, scope: :list_id
end
