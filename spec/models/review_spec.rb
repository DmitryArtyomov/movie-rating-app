require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { build(:review) }

  it "is valid with valid attributes" do
    expect(review).to be_valid
  end

  it "is valid without text" do
    review.text = nil
    expect(review).to be_valid
  end

  it "is not valid without movie" do
    review.movie = nil
    expect(review).to be_invalid
  end

  it "is not valid without user" do
    review.user = nil
    expect(review).to be_invalid
  end

  it "is not valid without rating" do
    review.rating = nil
    expect(review).to be_invalid
  end

  it "is not valid with a rating greater than 5" do
    review.rating = 6
    expect(review).to be_invalid
  end

  it "is not valid with a rating less than 1" do
    review.rating = 0
    expect(review).to be_invalid
  end

  context "when a review exists for a user-movie pair" do
    let!(:existing_review) { create(:review) }
    let(:review) { build(:review, user: existing_review.user, movie: existing_review.movie) }

    it "is not valid" do
      expect(review).to be_invalid
    end
  end

  context "when a review is created" do
    it "sends a 'prepend' update to multiple channels" do
      expect(Turbo::StreamsChannel).to receive(:broadcast_action_later_to).with(review.user,
                                                                                any_args,
                                                                                a_hash_including(action: :prepend))
      expect(Turbo::StreamsChannel).to receive(:broadcast_action_later_to).with(review.movie,
                                                                                any_args,
                                                                                a_hash_including(action: :prepend))
      review.save
    end
  end

  context "when a review is updated" do
    let!(:review) { create(:review)}

    it "sends a 'replace' update to multiple channels" do
      review.text = 'New text'
      expect(Turbo::StreamsChannel).to receive(:broadcast_action_later_to).with(review.user,
                                                                                any_args,
                                                                                a_hash_including(action: :replace))
      expect(Turbo::StreamsChannel).to receive(:broadcast_action_later_to).with(review.movie,
                                                                                any_args,
                                                                                a_hash_including(action: :replace))
      review.save
    end
  end

  context "when a review is destroyed" do
    let!(:review) { create(:review)}

    it "sends a 'remove' update to multiple channels" do
      expect(Turbo::StreamsChannel).to receive(:broadcast_remove_to).with(review.user, any_args)
      expect(Turbo::StreamsChannel).to receive(:broadcast_remove_to).with(review.movie, any_args)
      review.destroy
    end
  end
end
