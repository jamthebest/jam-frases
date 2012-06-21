class FrasesController < ApplicationController
  def index
    @frases = Frase.all
    respond_to do |format|
      format.html
      format.json { render json: @frase }
    end
  end

  def create
    respond_to do |format|
      if logged_in? && !(current_user.tipo.eql? "Bloqueado")
        @frase = Frase.new(params[:id])
        if @frase.save
          format.html { redirect_to @frase, flash[:notice] = 'Frase Agregada!' }
          format.json { render json: @frase, status: :created, location: @frase }
        else
          format.html { render action: "new" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      else
        if !logged_in?
          format.html { redirect_to login_path, flash[:error] = "Necesitas Autenticarte para hacer esto!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to root_url, flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def new
    respond_to do |format|
      if logged_in? && !(current_user.tipo.eql? "Bloqueado")
        @frase = Frase.new
        format.html
        format.json { render json: @frase }
      else
        if !logged_in?
          format.html { redirect_to login_path, flash[:error] = "Necesitas Autenticarte para hacer esto!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to root_url, flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if logged_in? && ((current_user.id == Book.find(params[:id]).user_id && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
        @frase = Frase.find(params[:id])
        if @frase.update_attributes(params[:frase])
          format.html { redirect_to @frase, flash[:notice] = 'Frase Actualizada!' }
          format.json { render json: @frase, status: :created, location: @frase }
        else
          format.html { render action: "edit" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      else
        if !logged_in? || (current_user.id != Book.find(params[:id]).user_id)
          format.html { redirect_to login_path, flash[:error] = "No tienes Permiso para editar esta Frase!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to root_url, flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    respond_to do |format|
      if logged_in? && ((current_user.id == Book.find(params[:id]).user_id && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
        @frase = Frase.find(params[:id])
        format.html
        format.json { render json: @frase }
      else
        if !logged_in? || (current_user.id != Book.find(params[:id]).user_id)
          format.html { redirect_to login_path, flash[:error] = "No tienes Permiso para editar esta Frase!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to root_url, flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def show
    @frase = Frase.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @frase }
    end
  end

  def destroy
    respond_to do |format|
      if logged_in? && ((current_user.id == Book.find(params[:id]).user_id && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
        Frase.find(params[:id]).try(:delete)
        format.html { redirect_to frases_path }
        format.json { head :no_content }
      else
        if logged_in? && (current_user.tipo.eql? "Bloqueado")
          format.html { redirect_to root_url, flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to login_path, flash[:error] = "No tienes Permiso para eliminar esta Frase" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
