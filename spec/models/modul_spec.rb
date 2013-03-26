require 'spec_helper'

describe Modul do
  it {should validate_presence_of :key}
  it {should validate_presence_of :name}
  it {should validate_presence_of :credits}

  context "fractional credit point" do
    subject {Modul.new credits: 14.2}

    its(:credits) {should eq 14.2}
  end
end
