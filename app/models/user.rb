class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true

  before_validation :set_token

  def set_token
    self.token = SecureRandom.hex
  end
end
