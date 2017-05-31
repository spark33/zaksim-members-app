class CreateWaitStatuses < ActiveRecord::Migration
  def change
    create_table :wait_statuses do |t|
      t.string :table_type
      t.date :start_date
      t.integer :member_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
