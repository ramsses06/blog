module ArticlesHelper
	
	def size_img_db(articuloID)
		if current_user.articles.find(articuloID) then
			articulo = current_user.articles.find(articuloID)
			tamano = 3 - articulo.pictures.size()
			return tamano
		else
			tamano = 3
			return tamano
		end
	end

end