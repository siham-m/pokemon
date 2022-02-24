class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :description, presence: true
  validates :speed, presence: true, numericality: true
  validates :hp, presence: true, numericality: true
  validates :special_defense, presence: true, numericality: true
  validates :special_attack, presence: true, numericality: true
  validates :defense, presence: true, numericality: true
  validates :attack, presence: true, numericality: true

  has_one_attached :photo

  def attacks
    #Retourne les attaques qui sont dans la liste des nom d'attaques
    Attack.where(name: attack_names)
  end

  def max_power
    attacks.maximum(:power)
  end

  def min_power
    attacks.minimum(:power)
  end

  def sum
    hp + defense + attack + special_attack + special_defense + speed
  end
end
