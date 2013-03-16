require 'spec_helper'

describe Constraints::Credits do
  subject {Constraints::Credits.new 5}

  include ConstraintsInterface
end
