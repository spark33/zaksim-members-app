class WaitStatus < ActiveRecord::Base

	TABLE_TYPES = [['Zaksim',:zaksim], ['Cambridge', :cambridge], ['Cambridge Prime',:cambridge_prime],['자유석', :free_seating]]

	scope :chronological, ->{ order('start_date DESC') }
	scope :for_member, ->(member_id){ where(member_id: member_id) }
	scope :current, ->{ where(end_date: nil) }

	after_create :cascade_end_date
	
	def set_end_date
		self.end_date = Date.today
		self.save!
	end

	def cascade_end_date
		member_ws = WaitStatus.for_member(self.member_id)
		member_ws.each do |ws|
			if ws.end_date.nil? and ws.id != self.id
				ws.end_date = Date.today
				ws.save!
			end
		end
	end

	def member
		Member.find(self.member_id)
	end

	def employee
		Employee.find(self.employee_id)
	end

	def self.to_csv
    CSV.generate do |csv|
      col_names = column_names - ['id','member_id', 'employee_id'] + ['Member', 'Employee']
      csv << col_names
      all.each do |result|
        csv << result.attributes.values_at(*(col_names-['Member', 'Employee'])) + [result.member.name, result.employee.name]
      end
    end
  end

end
