FactoryBot.define do
  sequence(:email) {|n| "test#{n}@test.com"}

  factory :user do
    email
    password "123456"
    first_name "Test"
    last_name "Erino"
    admin false
  end

  factory :admin, class: User do
    email
    password "123456"
    admin true
    first_name "Test"
    last_name "Erino"
  end
end