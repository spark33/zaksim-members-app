class Member < ActiveRecord::Base

	GENDERS = [['남', :male],['여', :female],['Other', :other]]
		
	scope :alphabetical, -> { order('name') }
	scope :birthday_today, -> { where("cast(strftime('%m', birthdate) as int) = ? AND cast(strftime('%d', birthdate) as int) = ?", Date.today.month, Date.today.day) }

	validates_presence_of :name, :phone, :gender, :join_date, :birthdate, :school

	def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	end

	def status
		ws = WaitStatus.for_member(self.id).current.first
		return ws unless ws.nil?
		reg = Registration.for_member(self.id).current.first
		return reg unless reg.nil?
		nil
	end

	def status_string
		if self.status.class.name == "Registration"
      return "#{self.status.seat_number}번 테이블 ~#{self.status.end_date}"
    elsif self.status.class.name == "WaitStatus"
      return "#{self.status.table_type.capitalize} 테이블 #{self.status.start_date}부터 대기 중"
    else 
      return "없음"
    end
	end

	def employee
		Employee.find(self.employee_id)
	end

	def self.to_csv

    CSV.generate do |csv|
      csv << column_names + ['Status']
      all.each do |result|
        csv << result.attributes.values_at(*column_names - ['Status']) + [result.status_string]
      end
    end
  end

end
