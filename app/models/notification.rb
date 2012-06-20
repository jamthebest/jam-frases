class Notification < ActiveRecord::Base
  attr_accessible :contenido, :de, :leido, :para, :tipo
end
