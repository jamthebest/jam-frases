class MessagesController < ApplicationController
    def index
    if logged_in? && !(current_user.tipo.eql? "Bloqueado")
      @messages = Message.where para: current_user.id
      respond_to do |format|
        format.html
        format.json { render json: @messages }
      end
    else
      if !(logged_in?)
        flash[:error] = "Necesitas Autenticarte para ver los Mensajes!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to user_path(current_user.id)
      end
    end
  end

  def show
    if logged_in? && ((current_user.id == Message.find(params[:id]).para && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
      @message = Message.find(params[:id])
      @message[:leido] = true
      respond_to do |format|
        if @message.update_attributes(params[:message])
          format.html
          format.json { render json: @message }
        end
      end
    else
      if !(logged_in?)
        flash[:error] = "Necesitas Autenticarte para ver los Mensajes!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to user_path(current_user.id)
      end
    end
  end

  def new
    if logged_in? && !(current_user.tipo.eql? "Bloqueado")
      @message = Message.new
      respond_to do |format|
        format.html
        format.json { render json: @message }
      end
    else
      if !(logged_in?)
        flash[:error] = "Necesitas Autenticarte para enviar Mensajes!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to user_path(current_user.id)
      end
    end
  end

  def create
    if logged_in? && !(current_user.tipo.eql? "Bloqueado")
      @message = Message.new(params[:message])
      x = User.find_by_username(params[:message][:para].downcase)
      if x
        @message[:para] = x.id
        @message[:de] = current_user.id
        @message[:leido] = false
        respond_to do |format|
          if @message.save
            flash[:notice] = "Mensage Enviado!" 
            format.html { redirect_to user_path(@message[:para].to_i)}
            format.json { render json: user_path(@message[:para].to_i), status: :created, location: user_path(params[:para].to_i) }
          else
            format.html { redirect_to user_path(@message[:para].to_i) }
            format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end
      else
        if !(logged_in?)
          flash[:error] = "Necesitas Autenticarte para hacer esto!"
          redirect_to login_path
        else
          flash[:error] = "Usuario Bloqueado por Administrador!"
          redirect_to user_path(current_user.id)
        end
      end
    else
      flash[:error] = 'Usuario no encontrado!'
      render action: "new"
  end

  def destroy
    @message = Message.find(params[:id]).try(:delete)
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.json { head :no_content }
    end
  end

  def update
  end

  def edit
  end
end
