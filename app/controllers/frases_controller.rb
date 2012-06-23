class FrasesController < ApplicationController
  def index
    @frases = Frase.all
    respond_to do |format|
      format.html
      format.json { render json: @frase }
    end
  end

  def create
    if logged_in? && !(current_user.tipo.eql? "Bloqueado")
      @frase = Frase.new(params[:frase])
      @frase[:user_id] = current_user.id
      if @frase.save
        flash[:notice] = 'Frase Agregada!'
        redirect_to @frase
      else
        render action: "new"
      end
    else
      if !logged_in?
        flash[:error] = "Necesitas Autenticarte para hacer esto!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to root_url
      end
    end
  end

  def new
    if logged_in? && !(current_user.tipo.eql? "Bloqueado")
      @frase = Frase.new
      respond_to do |format|
        format.html
        format.json { render json: @frase }
      end
    else
      if !(logged_in?)
        flash[:error] = "Necesitas Autenticarte para hacer esto!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to root_url
      end
    end
  end

  def update
    if logged_in? && ((current_user.id == Frase.find(params[:id]).user_id && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
      @frase = Frase.find(params[:id])
      if @frase.update_attributes(params[:frase])
        respond_to do |format|
          format.html { redirect_to @frase, flash[:notice] = 'Frase Actualizada!' }
          format.json { render json: @frase, status: :created, location: @frase }
        end
      else
        render action: "edit"
      end
    else
      if !logged_in? || (current_user.id != Frase.find(params[:id]).user_id)
        flash[:error] = "No tienes Permiso para editar esta Frase!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to root_url
      end
    end
  end

  def edit
    if logged_in? && ((current_user.id == Frase.find(params[:id]).user_id && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
      @frase = Frase.find(params[:id])
      respond_to do |format|
        format.html
        format.json { render json: @frase }
      end
    else
      if !logged_in? || (current_user.id != Frase.find(params[:id]).user_id)
        flash[:error] = "No tienes Permiso para editar esta Frase!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to root_url
      end
    end
  end

  def show
    @frase = Frase.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.json { render json: @frase }
    end
  end

  def destroy
    if logged_in? && ((current_user.id == Frase.find(params[:id]).user_id && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
      Frase.find(params[:id]).try(:delete)
      respond_to do |format|
        format.html { redirect_to frases_path }
        format.json { head :no_content }
      end
    else
      if logged_in? && (current_user.tipo.eql? "Bloqueado")
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to root_url
      else
        flash[:error] = "No tienes Permiso para eliminar esta Frase"
        redirect_to login_path
      end
    end
  end
end
