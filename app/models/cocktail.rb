class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true
  validates :colour, presence: true, inclusion: { in: ["red", "yellow", "orange", "green", "blue"]}
end
