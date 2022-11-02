class AddReleaseDateToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :release_date, :date
  end
end
