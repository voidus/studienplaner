require 'spec_helper'

describe Constraints::Credits do
  subject(:constraint) {Constraints::Credits.new 5}

  include ConstraintsInterface

  specify "fails with insufficient credits" do constraint.satisfied_by?(stub(credits: 3)).should be_false end
  specify "succeeds with sufficient credits" do constraint.satisfied_by?(stub(credits: 9)).should be_true end
end
