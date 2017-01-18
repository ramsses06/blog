class Users::OmniauthCallbacksController < ApplicationController

  def twitter
    #ver los parametros que nos interesan de facebook
      # raise request.env["omniauth.auth"]["info"]["email"].to_yaml

      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted? #verifica si esta guardado en la base de datos
        @user.remember_me = true #para recordar la sesion de usuario
        sign_in_and_redirect @user, event: :authentication #inicia sesion si encuentra al usuario
      else
        session["devise.auth"] = request.env["omniauth.auth"] #guardamos la info de facebook en una sesion
        render :edit #/users/omniauth_callbacks/edit
      end
  end

  def sign_up_data
    @user = User.from_omniauth(session["devise.auth"])
    if @user.update(user_params)
      sign_in_and_redirect @user, event: :authentication
      @user.remember_me = true
    else
      # raise params.to_yaml
      render :edit
    end
  end

  def failure #en caso de haber un error
      redirect_to new_user_session_path, notice: "Error al iniciar sesión con Twitter. Intenta de nuevo por favor"
  end

  private
    def user_params
      params.require(:user).permit(:email)
    end

end
