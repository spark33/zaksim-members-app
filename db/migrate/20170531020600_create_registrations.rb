class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :member_id
      t.string :seat_number
      t.date :start_date
      t.date :end_date
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
