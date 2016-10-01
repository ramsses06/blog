class Article < ActiveRecord::Base

	# hace referencia a un usuario
	belongs_to :user
	has_many :comments
	has_many :pictures 
	
	#referencia muchas categorias
	has_many :has_categories
	has_many :categories, through: :has_categories
	has_one :view

	validates :title, presence: {message: "= El titulo requerido"}, length: {minimum: 5 , message: "= Minimo 5 caracteres"}, uniqueness: {message: "= Este titulo ya existe"}, format: {with: /\A[a-zA-Z0-9 ]+\z/ , message: "= Solo acepta letras y numeros"}
	validates :body, presence: {message: "= El cuerpo del articulo es requerido"}, length: {minimum: 20, message: "= El articulo debe contener minimo 20 carateres"}
	#validar con expresion regular 
	# validates :campo, format: { with: /regex/ }

	

	after_create :save_categories #antes de crear guarda las catagorias guardadas por el custom setter
	before_update :borrar_HasCategory
	after_update :update_categories
	before_update :borrar_imagenes



	#custom setter ->  guardar id de categorias en un arreglo
	def categories=(values)
		@categories = values
	end
	def articuloID=(values)
		@articuloID = values
	end

	def imagenes=(values)
		@imagenes = values
	end
	

	def inc_visits()
		@vista = View.where(article_id: self.id)
		@vista.each do |vista|
			vista.update(vistas: vista.vistas + 1 )
		end
	end

	def validar_imagenes(images_array,articuloID)
		articulo = Article.find(@articuloID)
		if articulo.pictures.where('article_id = ?',articuloID) then
			tamano_images_db = articulo.pictures.where('article_id = ?',articuloID).size
		else
			tamano_images_db = 0
		end

		if images_array then
			tamano_images_enviadas = images_array.size
		else
			tamano_images_enviadas = 0
		end
		espacios_disponibles = 3 - tamano_images_db
		if tamano_images_enviadas > espacios_disponibles
			return false
		else
			return true
		end
	end

	private
	def save_categories()
		if @categories then
			@categories.each do |cat_id|
				HasCategory.create(category_id: cat_id, article_id: self.id)
			end
		end
		View.create(article_id: self.id)
	end
	def update_categories()
		if @categories then
			@categories.each do |cat_id|
				HasCategory.create(category_id: cat_id, article_id: self.id)
			end
		end
	end
	def borrar_imagenes()
		articulo = Article.find(@articuloID)
		if @imagenes then
			@imagenes.each do |imagenID|
				borrar = articulo.pictures.find(imagenID)
				if borrar then
					borrar.destroy
				end
			end
		end
	end
	def borrar_HasCategory()
			borrar = HasCategory.where('article_id = ?',@articuloID)
			if borrar then
				borrar.destroy_all
			end
	end

end