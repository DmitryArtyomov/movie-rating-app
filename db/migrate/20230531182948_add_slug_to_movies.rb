class AddSlugToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :slug, :string, null: false
    add_index :movies, :slug, unique: true
  end
end
