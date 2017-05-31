class Member < ActiveRecord::Base

	GENDERS = [['Male', :male],['Female', :female],['Other', :other]]
	AGE_GROUPS = [['Adult', :adult],['High School Student', :high_school],['College Student', :college], ['Other Student', :other_student]]

end
