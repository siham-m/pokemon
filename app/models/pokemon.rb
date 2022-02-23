class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :height, presence: true
  validates :weight, presence: true
end
