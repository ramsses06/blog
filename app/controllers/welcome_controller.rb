class WelcomeController < ApplicationController
  def index()
  	# @articulos = Article.all.limit(4).order("id DESC")
  	@articulos = Article.all.order("id DESC")
  end
end
