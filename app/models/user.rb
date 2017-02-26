class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]
  validates_inclusion_of :authentication_level, :in => 1..3, message: "nivel de permisos inválido"

  has_many :articles
  has_many :comments


	#Incluir los metodos de CONCERN
	include AuthenticationConcern

  def self.from_omniauth(auth)
    where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
      if auth["info"]["email"]
        user.email = auth["info"]["email"]
      end
      user.password = Devise.friendly_token[0,20] #crea clave de 20 caracteres
    end
  end

  def usuario_normal?
    self.errors.add(:authentication_level, :invalid, message: "No puedes crear usuarios normales") if authentication_level == 1
  end

end
