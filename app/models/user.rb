class User < ActiveRecord::Base
  validates :name, presence: true
  validates :role, presence: true
  validates :email, presence: true
  has_secure_password

  def is_owner?
    role == "owner"
  end
end
