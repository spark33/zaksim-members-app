class Member < ActiveRecord::Base

	GENDERS = [['남', :male],['여', :female],['Other', :other]]
		
	scope :alphabetical, -> { order('name') }
	scope :birthday_today, -> { where("cast(strftime('%m', birthdate) as int) = ? AND cast(strftime('%d', birthdate) as int) = ?", Date.today.month, Date.today.day) }

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

	def employee
		Employee.find(self.employee_id)
	end

	def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

end
