class Cocktail < ApplicationRecord
  has_many :doses
  has_many :ingredients
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
