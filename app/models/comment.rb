class Comment < ActiveRecord::Base
  attr_accessible :contenido, :frase_id, :user_id
  validates_presence_of :contenido, :frase_id, :user_id
  belongs_to :frase
end
