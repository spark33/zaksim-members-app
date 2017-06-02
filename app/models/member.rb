class Member < ActiveRecord::Base

	GENDERS = [['남', :male],['여', :female],['Other', :other]]
	AGE_GROUPS = [['Adult', :adult],['High School Student', :high_school],['College Student', :college], ['Other Student', :other_student]]

end
