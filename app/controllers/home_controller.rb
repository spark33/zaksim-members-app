class HomeController < ApplicationController

	def home
		@recent_posts = Post.recent.chronological
	end

end
