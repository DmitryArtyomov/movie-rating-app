class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, -> { order(id: :desc) }, inverse_of: :user

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }, format: { with: /\A[0-9a-zA-Z_-]+\z/,
    message: "only alphanumeric characters and - _ symbols" }
end
