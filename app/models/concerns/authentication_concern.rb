module AuthenticationConcern
	extend ActiveSupport::Concern

	def is_normal_user?
		self.authentication_level >= 1
	end
	def is_editor?
		self.authentication_level >= 2
	end
	def is_admin?
		self.authentication_level == 3
	end

end