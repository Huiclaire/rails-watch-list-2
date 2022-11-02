class AddBackdropPathToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :backdrop_path, :string
  end
end
