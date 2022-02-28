class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true

  before_create :set_token

  def set_token
    self.token = "ABC"
  end
end
