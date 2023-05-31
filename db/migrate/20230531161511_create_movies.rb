class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :director, null: false
      t.integer :year, null: false
      t.string :description
      t.string :image_url

      t.timestamps
    end
    add_index :movies, :title
    add_index :movies, :director
    add_index :movies, :year
  end
end
