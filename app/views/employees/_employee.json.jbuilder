json.extract! employee, :id, :name, :start_date, :phone, :email, :level, :password_digest, :created_at, :updated_at
json.url employee_url(employee, format: :json)
