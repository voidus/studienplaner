FactoryGirl.define do
  factory :studiengang do
    sequence(:name) {|n| "Teststudiengang ##{n}"}
  end
end
