class WelcomeController < ApplicationController

	before_action :authenticate_admin!, only: [:dashboard]

  def index()
  	@articulos = Article.paginate(page: params[:page], per_page:3).publicados.ultimos
  end

  def dashboard()
  	@articulos = Article.all.order("id DESC")
  end

  def search()
    respond_to do |format|
        format.js {
          @articlesearch = Article.search(params[:title])
        }
        format.html {
          @articlesearch = Article.search(params[:title])
        }
    end
  end

end
