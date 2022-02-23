class Pokemon < ApplicationRecord
  validates :name, uniqueness: true
  validates :height, presence: true
  validates :weight, presence: true
end
