json.extract! registration, :id, :member_id, :seat_number, :start_date, :end_date, :employee_id, :created_at, :updated_at
json.url registration_url(registration, format: :json)
