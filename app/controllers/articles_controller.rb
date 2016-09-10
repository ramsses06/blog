class ArticlesController < ApplicationController

	#callback para realizar algo antes o despues de la acciones del controlador.
	before_action :authenticate_user! , except: [:show]
	before_action :editar_articulo, only: [:edit,:update,:destroy]
	before_action :set_articulos_user, only: [:update, :edit, :destroy]
	
	#GET /articles   ->   articles_path
	def index()
  		@articulos = current_user.articles.all
	end

	#GET /articles/:id   ->   article_path(:id)
	def show()
		@comment = Comment.new
		@articulo = Article.find(params[:id])
		@articulo.inc_visits()
		@comentarios = @articulo.comments.order("id DESC")
	end

	#GET /articles/new   ->   new_article_path
	def new()
		@articulo = current_user.articles.new()
		@category = Category.all
	end

	#POST /articles   ->   articles_path
	def create()
		# @articulo_new = Article.new(
		# 	title: params[:article][:title],
		# 	body: params[:article][:body]
		# 	)

		@articulo = current_user.articles.new(article_params())
		@articulo.afirmacion = true
		@articulo.categories = params[:categories] #llamando al custom setter del modelo
		if @articulo.save() then
			redirect_to @articulo
		else
			render :new #action
		end
	end

	#DELETE /articles/:id   ->   article_path(:id)
	def destroy()
		# @articulo = current_user.articles.find(params[:id])
		@articulo.destroy()
		redirect_to articles_path 
	end

	#GET /articles/:id/edit   ->   edit_article_path(:id)
	def edit()
		@articulo = current_user.articles.find(params[:id])
		@category = Category.all
	end

	#PUT/PATCH /articles/:id   ->   article_path(:id)
	def update()
		@articulo.borrar_HasCategory(params[:id])
		@articulo.categories = params[:categories]

		if @articulo.update(article_params()) then
			redirect_to @articulo
		else
			render :edit
		end
	end


	private
	def article_params()
		params.require(:article).permit(:title, :body, :imageblog) #nos pertmite traer solo los parametros deseados
	end
	def editar_articulo()
		unless Article.find(params[:id]).user == current_user then
			render file: "#{Rails.root}/public/404.html",  :status => 404
		end
	end
	def set_articulos_user()
		unless current_user.articles.find(params[:id]) then
			render file: "#{Rails.root}/public/404.html",  :status => 404
		else
			@articulo = current_user.articles.find(params[:id])
		end
	end

end