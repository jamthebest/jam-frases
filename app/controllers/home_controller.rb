class HomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def ranking
  	@frases = []
  	ban = (Frase.all.size > 10) ? 10 : Frase.all.size
  	x = Frase.all.sort { |x, y| y.likes <=> x.likes }
  	for i in 0..(ban-1)
  		@frases[i] = x[i]
  	end
  end
end
