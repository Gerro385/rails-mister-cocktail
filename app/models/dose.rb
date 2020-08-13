class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, :cocktail, :ingredient, presence: true
  # validates_uniqueness_of :dose_combo, scope: %i[cocktail_id ingredient_id]
  validates :cocktail, uniqueness: { scope: :ingredient }


end
