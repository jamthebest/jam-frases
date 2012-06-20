class Frase < ActiveRecord::Base
  attr_accessible :autor, :descripcion, :user_id
  validates_presence_of :descripcion
  before_validation :clean_descripcion, if: "descripcion.present?"
  has_many :comments
	belongs_to :user
  private
  def clean_descripcion
    self.descripcion = self.descripcion.strip.capitalize
    self.autor = self.autor.strip.capitalize
  end
end
