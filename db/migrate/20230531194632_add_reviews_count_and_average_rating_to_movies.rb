class AddReviewsCountAndAverageRatingToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :reviews_count, :integer, null: false, default: 0
    add_column :movies, :average_rating, :float

    add_index :movies, :average_rating
  end
end
