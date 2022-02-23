class Attack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
