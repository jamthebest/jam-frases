class Comment < ActiveRecord::Base
  attr_accessible :contenido, :frase_id, :user_id
end
