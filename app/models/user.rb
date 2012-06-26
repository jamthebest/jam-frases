class User < ActiveRecord::Base
	has_secure_password
  attr_accessible :apellido, :email, :fecha_nac, :nombre, :username, :tipo, :password, :password_confirmation
  validates_uniqueness_of :username, :email
  validates_presence_of :apellido, :email, :fecha_nac, :nombre, :username

  has_many :reviews
  has_many :notifications

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
