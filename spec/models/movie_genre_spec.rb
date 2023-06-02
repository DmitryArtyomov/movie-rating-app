require 'rails_helper'

RSpec.describe MovieGenre, type: :model do
  let(:movie_genre) { build(:movie_genre) }

  it "is valid with valid attributes" do
    expect(movie_genre).to be_valid
  end

  it "is not valid without movie" do
    movie_genre.movie = nil
    expect(movie_genre).to be_invalid
  end

  it "is not valid without genre" do
    movie_genre.genre = nil
    expect(movie_genre).to be_invalid
  end

  context "when there is an existing movie-genre pair" do
    let!(:movie) { create(:movie) }
    let!(:existing_movie_genre) { movie.movie_genres.first }
    let(:movie_genre) { build(:movie_genre, movie: movie, genre: existing_movie_genre.genre) }

    it "is not valid" do
      expect(movie_genre).to be_invalid
    end
  end
end
