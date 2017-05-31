class Employee < ActiveRecord::Base

	has_secure_password

	ROLES = [['Administrator', :admin],['Manager', :manager]]

	def role?(authorized_role)
    return false if role.nil?
    role.to_sym == authorized_role
  end
end
