class WaitStatus < ActiveRecord::Base

	TABLE_TYPES = [['Zaksim',:zaksim], ['Oxford', :oxford], ['Cambridge', :cambridge], ['Cambridge Prime',:cambridge_prime],['Bodleian', :bodleian]]

	scope :chronological, ->{ order('start_date DESC') }
	scope :for_member, ->(member_id){ where(member_id: member_id) }
	scope :current, ->{ where(end_date: nil) }

	after_create :set_end_date
	
	def set_end_date
		member_ws = WaitStatus.for_member(self.member_id.to_i)
		current_ws = member_ws.current
		unless current_ws.length <= 1
			current_ws.first.end_date = Date.today
			current_ws.first.save!
		end
	end

end
