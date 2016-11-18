class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_categories

  protected
  
  def authenticate_editor!
	unless user_signed_in? && current_user.is_editor? then
		redirect_to root_path
		flash[:notice] = "No tienes permiso para hacer esto."
	end
  end
  def authenticate_admin!
	unless user_signed_in? && current_user.is_admin? then
		redirect_to root_path
		flash[:notice] = "No tienes permiso para hacer esto."
	end
  end

  private
  def set_categories
	@categories_nav = Category.all
  end


end
