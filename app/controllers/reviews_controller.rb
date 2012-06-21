class ReviewsController < ApplicationController
  def index
    if logged_in? && (current_user.tipo.eql? "Administrador")
      @review = Review.all
      respond_to do |format|
        format.html
        format.json { render json: @review }
      end
    else
      flash[:error] = "No tienes derechos de Administrador!"
      redirect_to root_url
    end
  end

  def new
    @review = Review.new
    respond_to do |format|
      format.html
      format.json { render json: @review }
    end
  end

  def create
    respond_to do |format|
      if logged_in? && !(current_user.tipo.eql? "Bloqueado")
        @review = Review.create params[:review]
        @review[:user_id] = current_user.id
        @review[:perfil] = params["perfil"].to_i
        if @review.save
          format.html { redirect_to user_path(@review.perfil) }
          format.json { render json: @review, status: :created, location: @review }
        else
          format.html { redirect_to root_url }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      else
        if !logged_in?
          format.html { redirect_to login_path, flash[:error] = "Necesitas Autenticarte para hacer esto!" }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to user_path(@review.perfil), flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if logged_in? && (current_user.tipo.eql? "Administrador")
        @review = Review.find(params[:id])
        if @review.update_attributes(params[:review])
          format.html { redirect_to @review, flash[:notice] = 'Comentario Actualizado!' }
          format.json { render json: @review, status: :created, location: @review }
        else
          format.html { render action: "edit" }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to root_url, flash[:error] = "No tienes derechos de Administrador!" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
    respond_to do |format|
      if logged_in? && (current_user.tipo.eql? "Administrador")
        @review = Review.find(params[:id])
        format.html
        format.json { render json: @review }
      else
        format.html { redirect_to root_url, flash[:error] = "No tienes derechos de Administrador!" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if logged_in? && (current_user.tipo.eql? "Administrador")
        Review.find(params[:id]).try(:delete)
        format.html { redirect_to frases_path }
        format.json { head :no_content }
      else
        format.html { redirect_to root_url, flash[:error] = "No tienes derechos de Administrador!" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
end
