class AddEndDateToWaitStatuses < ActiveRecord::Migration
  def change
    add_column :wait_statuses, :end_date, :date
  end
end
