class FrasesController < ApplicationController
  def index
    @frases = Frase.all
    respond_to do |format|
      format.html
      format.json { render json: @frase }
    end
  end

  def create
    @frase = Frase.new(params[:id])
    respond_to do |format|
      if @frase.save
        format.html { redirect_to @frase, flash[:notice] = 'Frase Agregada!' }
        format.json { render json: @frase, status: :created, location: @frase }
      else
        format.html { render action: "new" }
        format.json { render json: @frase.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @frase = Frase.new
    respond_to do |format|
      format.html
      format.json { render json: @frase }
    end
  end

  def update
    @frase = Frase.find(params[:id])
    respond_to do |format|
      if @frase.update_attributes(params[:frase])
        format.html { redirect_to @frase, flash[:notice] = 'Frase Actualizada!' }
        format.json { render json: @frase, status: :created, location: @frase }
      else
        format.html { render action: "new" }
        format.json { render json: @frase.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @frase = Frase.find(params[:id])
  end

  def show
    @frase = Frase.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @frase }
    end
  end

  def destroy
    Frase.find(params[:id]).try(:delete)
    respond_to do |format|
      format.html { redirect_to frases_path }
      format.json { head :no_content }
    end
  end
end
