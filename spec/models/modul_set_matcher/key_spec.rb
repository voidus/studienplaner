require 'spec_helper'

describe ModulSetMatcher::Key do
  subject {ModulSetMatcher::Key.new "IN9FOO"}

  include ModulSetMatcherInterface

  specify {subject.matches?([]).should be_false}
  specify {subject.matches?(FactoryGirl.build_list(:modul, 4)).should be_false}

  specify {subject.matches?([FactoryGirl.build(:modul, key: "IN9FOO")]).should be_true}
  specify {
    subject.matches?(FactoryGirl.build_list(:modul, 4) << FactoryGirl.build(:modul, key: "IN9FOO")).should be_true
  }
end
