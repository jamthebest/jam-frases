class HomeController < ApplicationController
  def index
  	@search = Frase.search(params[:search])
  end
end
