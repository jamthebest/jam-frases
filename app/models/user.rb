class User < ActiveRecord::Base
	has_secure_password
	has_attached_file :photo, :styles => { :show => "200x200>", :index => "100x100>", :otro => "300x300>" }
  attr_accessible :photo
  attr_accessible :apellido, :email, :fecha_nac, :nombre, :username, :tipo, :password, :password_confirmation
  validates_uniqueness_of :username, :email
  validates_presence_of :apellido, :email, :fecha_nac, :nombre, :username

  has_many :reviews
  has_many :notifications
end
