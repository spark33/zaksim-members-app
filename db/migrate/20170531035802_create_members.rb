class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :gender
      t.date :join_date
      t.string :age_group
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
