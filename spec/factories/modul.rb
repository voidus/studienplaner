FactoryGirl.define do
  factory :modul do
    sequence(:name) {|n| "Testmodul ##{n}"}
    sequence(:key) {|n| "TEST#{n}"}
    credits Random.rand 20
  end
end
