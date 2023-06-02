require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without email" do
    user.email = nil
    expect(user).to be_invalid
  end

  it "is not valid without password" do
    user.password = nil
    expect(user).to be_invalid
  end

  it "is not valid without username" do
    user.username = nil
    expect(user).to be_invalid
  end

  it "is not valid with short username" do
    user.username = 'ab'
    expect(user).to be_invalid
  end

  it "is not valid with non-alphanumeric characters" do
    user.username = 'ab  cde'
    expect(user).to be_invalid
  end
end
