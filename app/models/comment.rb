class Comment < ActiveRecord::Base
  attr_accessible :contenido, :frase_id, :user_id
  validates_presence_of :contenido
  belongs_to :frase
end
