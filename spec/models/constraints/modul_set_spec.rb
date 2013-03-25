require 'spec_helper'

describe Constraints::ModulSet do
  context "with a simple modul set" do
    subject(:constraint) {Constraints::ModulSet.new ModulSetMatcher::Key.new "WUTWUT"}
    include ConstraintsInterface
  end

  context "with mocked modulSet" do
    before do
      @moduls = FactoryGirl.create_list(:modul, 5)
      @plan = double("studienplan")
      @plan.stub(:moduls) {@moduls}
      @modul_set = double('modulSet')
    end

    subject(:constraint) {Constraints::ModulSet.new @modul_set}

    specify "matches iff modulset matches" do
      @modul_set.stub(:matches?).with(@moduls) {true}
      constraint.satisfied_by?(@plan).should be_true
    end

    specify "doesn't match if modulset doesn't" do
      @modul_set.stub(:matches?).with(@moduls) {false}
      constraint.satisfied_by?(@plan).should be_false
    end
  end
end
