class AddCommentToMember < ActiveRecord::Migration
  def change
  	add_column :members, :comment, :text
  end
end
