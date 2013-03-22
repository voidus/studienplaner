FactoryGirl.define do
  factory :studienplan do
    sequence(:name) {|n| "Teststudienplan ##{n}"}
    studiengang FactoryGirl.build :studiengang
  end
end
