class ChangeRoleColumnName < ActiveRecord::Migration
  def change
  	rename_column :employees, :level, :role
  end
end
