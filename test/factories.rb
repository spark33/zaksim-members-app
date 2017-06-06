FactoryGirl.define do
  factory :employee do
    name 'Admin'
    start_date Date.today
    phone 111
    email 'admin@admin.com'
    role 'admin'
    password 'secret'
    password_confirmation 'secret'
  end
end