class Card < ApplicationRecord
  belongs_to :pokemon
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end
