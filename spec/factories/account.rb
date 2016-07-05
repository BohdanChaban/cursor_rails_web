FactoryGirl.define do
  factory :account do
    name 'Leonardo'
    age 29
    after(:create) {:create_inverse}
  end
end