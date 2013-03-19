require 'spec_helper'

describe "Studienplan Model" do
  let(:studienplan) { Studienplan.new }
  it 'can be created' do
    studienplan.should_not be_nil
  end
end
