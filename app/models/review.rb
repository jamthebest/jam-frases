class Review < ActiveRecord::Base
  attr_accessible :contenido, :perfil, :user_id
end
