class NotificationsController < ApplicationController
  def index
    if logged_in? && !(current_user.tipo.eql? "Bloqueado")
      @notifications = Notification.where para: current_user.id
      respond_to do |format|
        format.html
        format.json { render json: @notifications }
      end
    else
      if !(logged_in?)
        flash[:error] = "Necesitas Autenticarte para ver las notificaciones!"
        redirect_to login_path
      else
        flash[:error] = "Usuario Bloqueado por Administrador!"
        redirect_to user_path(current_user.id)
      end
    end
  end

  def show
    respond_to do |format|
      if logged_in? && ((current_user.id == Notification.find(params[:id]).para && !(current_user.tipo.eql? "Bloqueado")) || (current_user.tipo.eql? "Administrador"))
        @notification = Notification.find(params[:id])
        @notification[:leido] = true
        if @notification.update_attributes(params[:notification])
          format.html { redirect_to @notification }
          format.json { render json: @notification }
        end
      else
        if !(logged_in?)
          format.html { redirect_to login_path, flash[:error] = "Necesitas Autenticarte para ver las notificaciones!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to user_path(current_user.id), flash[:error] = "Usuario Bloqueado por Administrador!" }
          format.json { render json: @frase.errors, status: :unprocessable_entity }
        end
      end
  end

  def new
    @notification = Notification.new
    respond_to do |format|
      format.html
      format.json { render json: @notifications }
    end
  end

  def create
    if logged_in? && !(current_user.tipo.eql? "Bloqueado")
      @notification = Notification.new(params[:notification])
      @notification[:description] = params[:description]
      @notification[:para] = params[:para].to_i
      @notification[:de] = current_user.id
      @notification[:tipo] = params[:tipo].to_i #Tipos: 1=>Reportar, 2=>Gustar, 3=>
      @notification[:leido] = false
      respond_to do |format|
        if @notification.save
          if params[:tipo].to_i == 1
            flash[:notice] = "Reporte Enviado al Administrador." 
          else
            if params[:tipo]-to_i == 2
              flash[:notice] = "Te gusta esta Frase."
            end
          end
          format.html { redirect_to frases_path}
          format.json { render json: frases_path, status: :created, location: frases_path }
        else
          format.html { redirect_to frases_path }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
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

  def destroy
    @notifications = Notification.find(params[:id]).try(:delete)
    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.json { head :no_content }
    end
  end

  def update
  end

  def edit
  end
end
