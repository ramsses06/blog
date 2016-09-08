class Article < ActiveRecord::Base

	# hace referencia a un usuario
	belongs_to :user
	has_many :comments
	# referencia a la imagen
	has_attached_file :imageblog, styles: {medium:"1280x720", thumb:"900x300#"}

	validates :title, presence: {message: "= El titulo requerido"}, length: {minimum: 5 , message: "= Minimo 5 caracteres"}, uniqueness: {message: "= Este titulo ya existe"}, format: {with: /\A[a-zA-Z0-9 ]+\z/ , message: "= Solo acepta letras y numeros"}
	validates :body, presence: {message: "= El cuerpo del articulo es requerido"}, length: {minimum: 20, message: "= El articulo debe contener minimo 20 carateres"}
	#validar con expresion regular 
	# validates :campo, format: { with: /regex/ }

	#validaciones para paperclip
	validates_attachment_content_type :imageblog, content_type: /\Aimage/
	validates_attachment_file_name :imageblog, matches: [/png\z/,/jpe?g\z/]
	do_not_validate_attachment_file_type :imageblog

	before_save :visits_count_default

	def visits_count_default()
		self.visits_count ||= 0
	end

	def inc_visits()
		# self.save() if self.visits_count.nil?
		self.update(visits_count: self.visits_count + 1 )
	end

end