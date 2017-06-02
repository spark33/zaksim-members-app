class Post < ActiveRecord::Base

	scope :recent, ->{ where("? <= created_at", Date.today - 2) }
	scope :chronological, ->{ order("created_at") }

end
