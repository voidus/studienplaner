require 'spec_helper'

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
