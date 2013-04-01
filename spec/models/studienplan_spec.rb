# == Schema Information
#
# Table name: studienplans
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  studiengang_id :integer
#

require 'spec_helper'

describe Studienplan do
  it 'can be created' do
    subject.should_not be_nil
  end

  context "moduls given to the constructor" do
    before do
      @moduls = [FactoryGirl.build(:modul, credits: 32), FactoryGirl.build(:modul, credits: 35.2)]
    end

    subject {Studienplan.new moduls: @moduls}

    its(:credits) {should eq 67.2}
  end

  context "moduls from studiengang" do
    before do
      @initial_moduls = FactoryGirl.build_list(:modul, 5)
      @studiengang = FactoryGirl.build(:studiengang, initial_moduls: @initial_moduls)
    end

    subject {Studienplan.new studiengang: @studiengang}

    its(:moduls) {should eq @initial_moduls}
  end
end
