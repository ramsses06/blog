class Picture < ActiveRecord::Base
	belongs_to :article

  # referencia a la imagen
	has_attached_file :image, :path=>":rails_root/public/images/:id/:filename", :url=>"/images/:id/:filename" , styles: { medium:"900x300#", thumb:"300x100#" }

	#validaciones para paperclip
	validates_attachment_content_type :image, content_type: /\Aimage/
	validates_attachment_file_name :image, matches: [/png\z/,/jpe?g\z/]
	do_not_validate_attachment_file_type :image


end
