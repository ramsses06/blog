class AddImageblogToArticles < ActiveRecord::Migration
  def change
  	add_attachment :articles, :imageblog
  end
end
