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

  context "simple example" do
    subject (:plan) do
      plan = Studienplan.new

      m1 = Modul.new
      m1.stub credits: 33
      m2 = Modul.new
      m2.stub credits: 35.2
      plan.moduls = [m1, m2]

      plan
    end

    its(:credits) {should == 68.2}
  end
end
