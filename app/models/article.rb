class Article < ActiveRecord::Base

	# hace referencia a un usuario
	belongs_to :user
	has_many :comments

	validates :title, presence: {message: "= El titulo requerido"}, length: {minimum: 5 , message: "= Minimo 5 caracteres"}, uniqueness: {message: "= Este titulo ya existe"}, format: {with: /\A[a-zA-Z0-9 ]+\z/ , message: "= Solo acepta letras y numeros"}
	validates :body, presence: {message: "= El cuerpo del articulo es requerido"}, length: {minimum: 20, message: "= El articulo debe contener minimo 20 carateres"}
	#validar con expresion regular 
	# validates :campo, format: { with: /regex/ }

	before_save :visits_count_default

	def visits_count_default()
		self.visits_count ||= 0
	end

	def inc_visits()
		# self.save() if self.visits_count.nil?
		self.update(visits_count: self.visits_count + 1 )
	end

end