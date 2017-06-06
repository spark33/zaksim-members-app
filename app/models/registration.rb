class Registration < ActiveRecord::Base

	scope :for_member, ->(member_id){ where(member_id: member_id) }
	scope :current, ->{ where("start_date <= ? AND ? <= end_date", Date.today, Date.today) }
	scope :almost_done, ->{ where("? < end_date AND end_date < ?", Date.today, Date.today + 5)}
	scope :chronological, ->{ order("start_date DESC") }

	after_create :end_wait_status
	after_update :end_wait_status
	validate :check_dates
	validates_uniqueness_of :seat_number
	validates_presence_of :start_date, :end_date

	def end_wait_status
		current_registrations = Registration.current
		if current_registrations.include?(self)
    	ws = WaitStatus.for_member(self.member_id).current.first
    	ws.set_end_date unless ws.nil?
    end
  end

  def check_dates
  	member_registrations = Registration.for_member(self.member_id)
  	member_registrations.each do |r|
  		if ((r.start_date <= self.start_date and self.start_date <= r.end_date) or
					(r.start_date <= self.end_date and self.end_date <= r.end_date)) and r.id != self.id
				errors.add(:registration, "날짜가 겹칩니다. 다시 확인 해주세요.")
				return false
			end
  	end
  end

  def member
  	Member.find(self.member_id)
  end

end
