class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  validates :colour, presence: true, inclusion: { in: ["red", "yellow", "orange", "green", "blue"]}
end
