class Registration < ActiveRecord::Base

	scope :for_member, ->(member_id){ where(member_id: member_id) }
	scope :current, ->{ where("start_date <= ? AND ? <= end_date", Date.today, Date.today) }

	after_create :end_wait_statuses

	def end_wait_statuses
    ws = WaitStatus.for_member(self.member_id).current.first
    ws.set_end_date
  end

end
