class Registration < ActiveRecord::Base

	scope :for_member, ->(member_id){ where(member_id: member_id) }

end
