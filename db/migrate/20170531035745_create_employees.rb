class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.date :start_date
      t.string :phone
      t.string :email
      t.string :level
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
