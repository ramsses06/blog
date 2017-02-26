class Users::AdminCreatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.usuario_normal? then
      render :new
    else
      if @user.save()
        redirect_to root_path, notice: "Usuario creado"
      else
        render :new
      end
    end

  end

  private
    def user_params
      params.require(:user).permit(:email, :authentication_level, :password, :password_confirmation)
    end

end
