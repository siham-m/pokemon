class Attack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :accuracy, presence: true
  validates :power, presence: true
end
