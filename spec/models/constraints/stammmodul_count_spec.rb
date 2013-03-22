require 'spec_helper'

FactoryGirl.define do
  factory :modul do
    sequence(:name) {|n| "Testmodul ##{n}"}
  end

  factory :studiengang do
    sequence(:name) {|n| "Teststudiengang ##{n}"}
  end

  factory :studienplan do
    sequence(:name) {|n| "Teststudienplan ##{n}"}
    studiengang FactoryGirl.build :studiengang
  end
end


describe Constraints::StammmodulCount do
  subject(:constraint) {Constraints::StammmodulCount.new 2}

  include ConstraintsInterface

  specify "fails with too little stammmoduls" do
    plan = FactoryGirl.build(:studienplan)
    plan.moduls = [FactoryGirl.build(:modul), FactoryGirl.build(:modul, stammmodul: true)]

    constraint.satisfied_by?(plan).should be_false
  end

  specify "succeeds with enough stammmoduls" do
    plan = FactoryGirl.build(:studienplan)
    plan.moduls = [FactoryGirl.build(:modul, stammmodul: true), FactoryGirl.build(:modul, stammmodul: true)]

    constraint.satisfied_by?(plan).should be_true
  end
end
