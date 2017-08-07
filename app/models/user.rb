class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, :length => {:within => 4..40}

end
