class Attack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :accuracy, presence: true, numericality: true
  validates :power, presence: true, numericality: true
end
