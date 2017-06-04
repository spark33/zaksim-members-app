class Post < ActiveRecord::Base

	scope :recent, ->{ where("? <= created_at", Date.today - 2) }
	scope :chronological, ->{ order("created_at DESC") }
	scope :for_employee, ->(employee_id){ where(employee_id: employee_id) }

	def self.last_admin_post
		Post.chronological.each do |p|
			return p if p.employee.role? :admin
		end
		nil
	end

	def self.non_admin_posts
		non_admin_posts = Array.new
		Post.chronological.each do |p|
			non_admin_posts.push(p) unless Employee.find(p.employee_id).role? :admin
		end
		return non_admin_posts
	end

	def employee
		Employee.find(self.employee_id)
	end

end
