class HomeController < ApplicationController

	def home
		@recent_nonadmin_posts = Post.chronological.non_admin_posts.take(5)
		@last_admin_post = Post.last_admin_post
		@registrations_almost_done = Registration.almost_done.chronological
		@birthday_members = Member.birthday_today.alphabetical
	end

end
