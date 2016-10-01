class AddImageToPictures < ActiveRecord::Migration
  
  	add_attachment :pictures, :image
  
end
