class Frase < ActiveRecord::Base
  attr_accessible :autor, :descripcion, :user_id
end
