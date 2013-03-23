require 'spec_helper'

describe ModulSetMatcher::All do
  subject {ModulSetMatcher::All.new []}
  include ModulSetMatcherInterface

  context "without children" do
    subject {ModulSetMatcher::All.new []}

    it "matches empty array" do subject.matches?([]).should be_true end
    it "matches anything" do subject.matches?([nil]).should be_true end
  end

  context "with children" do
    before {
      @matcher1 = double('matcher 1')
      @matcher2 = double('matcher 2')
    }

    subject {ModulSetMatcher::All.new [@matcher1, @matcher2]}

    def stubMatchers m1, m2
      @matcher1.stub(:matches?).with(:matchee) {m1}
      @matcher2.stub(:matches?).with(:matchee) {m2}
    end

    it "doesn't match if no children match" do
      stubMatchers false, false
      subject.matches?(:matchee).should be_false
    end

    it "doesn't match if only some children match" do
      stubMatchers true, false
      subject.matches?(:matchee).should be_false
    end

    it "matches if all children match" do
      stubMatchers true, true
      subject.matches?(:matchee).should be_true
    end
  end
end
