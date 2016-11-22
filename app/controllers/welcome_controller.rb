class WelcomeController < ApplicationController

	before_action :authenticate_admin!, only: [:dashboard]

  def index()
  	@articulos = Article.publicados.ultimos
  end

  def dashboard()
  	@articulos = Article.all.order("created_at DESC")
  end

end
