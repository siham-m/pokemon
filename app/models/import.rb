class Import < ApplicationRecord
  validates :resource, presence: true, inclusion: ["pokemons", "attacks", "berries"]
  def duration
    ((updated_at - created_at) / 1.minutes).round(2)
  end
end
