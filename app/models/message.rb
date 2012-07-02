class Message < ActiveRecord::Base
  attr_accessible :asunto, :content, :de, :para, :leido
  validates_presence_of :para, :content
  belongs_to :user
end
