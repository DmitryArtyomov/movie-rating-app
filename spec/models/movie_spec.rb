require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { build(:movie) }

  it "is valid with valid attributes" do
    expect(movie).to be_valid
  end

  it "is valid without description" do
    movie.description = nil
    expect(movie).to be_valid
  end

  it "is not valid without title" do
    movie.title = nil
    expect(movie).to be_invalid
  end

  it "is not valid without director" do
    movie.director = nil
    expect(movie).to be_invalid
  end

  it "is not valid without year" do
    movie.year = nil
    expect(movie).to be_invalid
  end

  it "is not valid without genres" do
    movie.genres = []
    expect(movie).to be_invalid
  end

  context "rating recalculation" do
    let!(:movie) { create(:movie) }
    let(:review1) { create(:review, movie: movie, rating: 1) }
    let(:review2) { create(:review, movie: movie, rating: 5) }

    it "is ran after each review submission" do
      expect(movie).to receive(:recalculate_rating!).twice
      review1
      review2
    end

    it "is calculated correctly" do
      review1
      expect(movie.reload.average_rating).to eq(1)
      review2
      expect(movie.reload.average_rating).to eq(3)
    end

    it "sends rating update to this movie and 'movies' index channels" do
      expect(Turbo::StreamsChannel).to receive(:broadcast_replace_to).with(movie, any_args)
      expect(Turbo::StreamsChannel).to receive(:broadcast_replace_to).with('movies', any_args)
      review1
    end
  end
end
