class Notification < ActiveRecord::Base
  attr_accessible :contenido, :de, :leido, :para, :tipo
  belongs_to :user
end
