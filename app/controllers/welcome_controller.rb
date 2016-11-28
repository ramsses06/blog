class WelcomeController < ApplicationController

	before_action :authenticate_admin!, only: [:dashboard]

  def index()
  	@articulos = Article.paginate(page: params[:page], per_page:3).publicados.ultimos
  end

  def dashboard()
  	@articulos = Article.all.order("id DESC")
  end

end
