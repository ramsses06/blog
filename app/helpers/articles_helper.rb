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

	def checkbox(articuloID,categoryID)
		consulta = HasCategory.where("article_id = ? AND category_id = ?", articuloID, categoryID)
		unless consulta.empty? then
			consulta.each do |c|
				if c then
					return "checked"
				end
			end
		end
	end

end