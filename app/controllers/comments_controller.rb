class CommentsController < ApplicationController
  def index
    if logged_in? && (current_user.tipo.eql? "Administrador")
      @comment = Comment.all
      respond_to do |format|
        format.html
        format.json { render json: @comment }
      end
    else
      flash[:error] = "No tienes derechos de Administrador!"
      redirect_to root_url
    end
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def create
    respond_to do |format|
      if logged_in? && !(current_user.tipo.eql? "Bloqueado")
        @comment = Comment.create params[:comment]
        @comment[:user_id] = current_user.id
        @comment[:frase_id] = params["frase_id"].to_i
        if @comment.save
          format.html { redirect_to user_path(@comment.user_id) }
          format.json { render json: @comment, status: :created, location: @comment }
        else
          format.html { redirect_to root_url }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      else
        if !logged_in?
          format.html { redirect_to login_path, flash[:error] = "Necesitas Autenticarte para hacer esto!" }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to login_path, flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if logged_in? && (current_user.tipo.eql? "Administrador")
        @comment = Comment.find(params[:id])
        if @comment.update_attributes(params[:comment])
          format.html { redirect_to @comment, flash[:notice] = 'Comentario Actualizado!' }
          format.json { render json: @comment, status: :created, location: @comment }
        else
          format.html { render action: "edit" }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to root_url, flash[:error] = "No tienes derechos de Administrador!" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def show
    respond_to do |format|
      if logged_in? && (current_user.tipo.eql? "Administrador")
        @comment = Comment.find(params[:id])
        format.html
        format.json { render json: @comment }
      else
        format.html { redirect_to root_url, flash[:error] = "No tienes derechos de Administrador!" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if logged_in? && (current_user.tipo.eql? "Administrador")
        Comment.find(params[:id]).try(:delete)
        format.html { redirect_to frases_path }
        format.json { head :no_content }
      else
        format.html { redirect_to root_url, flash[:error] = "No tienes derechos de Administrador!" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
