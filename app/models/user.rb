class User < ActiveRecord::Base
  attr_accessible :apellido, :email, :fecha_nac, :nombre, :username
end
