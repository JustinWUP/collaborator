# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    time "9.99"
    description "MyText"
    active false
  end
end
