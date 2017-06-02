class WaitStatus < ActiveRecord::Base

	TABLE_TYPES = [['Zaksim',:zaksim], ['Oxford', :oxford], ['Cambridge', :cambridge], ['Cambridge Prime',:cambridge_prime],['Bodleian', :bodleian]]

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

end
