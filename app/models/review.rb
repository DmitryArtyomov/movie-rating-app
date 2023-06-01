class Review < ApplicationRecord
  belongs_to :movie, counter_cache: true, inverse_of: :reviews
  belongs_to :user, inverse_of: :reviews

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5 }
  validates :user_id, uniqueness: { scope: :movie_id }

  broadcasts_to ->(review) { review.movie }, inserts_by: :prepend, target: 'reviews'
  broadcasts_to ->(review) { review.user }, inserts_by: :prepend, target: 'profile-reviews',
    partial: 'reviews/profile_review'
  after_commit -> { movie.recalculate_rating! }
end
