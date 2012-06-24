class Frase < ActiveRecord::Base
  attr_accessible :autor, :descripcion, :user_id
  validates_presence_of :descripcion
  has_many :comments
	belongs_to :user
end
