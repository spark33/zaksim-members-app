class RemoveColumns < ActiveRecord::Migration
  def self.up
	  remove_column :members, :age_group
	end

	def self.down
    add_column :members, :age_group, :string
  end

end
