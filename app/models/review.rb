class Review < ActiveRecord::Base
  attr_accessible :contenido, :perfil, :user_id
  validates_presence_of :contenido
  belongs_to :user
end
