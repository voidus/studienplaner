FactoryGirl.define do
  factory :modul do
    sequence(:name) {|n| "Testmodul ##{n}"}
  end
end
