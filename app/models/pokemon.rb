class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :picture, presence: true

  def attacks
    #Retourne les attaques qui sont dans la liste des nom d'attaques
    Attack.where(name: attack_names)
  end

  def max_power
    attacks.maximum(:power)
  end
end
