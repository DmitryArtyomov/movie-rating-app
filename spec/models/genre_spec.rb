require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) { build(:genre) }

  it "is valid with valid attributes" do
    expect(genre).to be_valid
  end

  it "is not valid without name" do
    genre.name = nil
    expect(genre).to be_invalid
  end
end
