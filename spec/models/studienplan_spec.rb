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

describe "Studienplan Model" do
  let(:studienplan) { Studienplan.new }
  it 'can be created' do
    studienplan.should_not be_nil
  end
end
