#encoding: UTF-8
require 'spec_helper'

latex_source = <<EOF
some context
this shouldn't matter
  \\modulename{name with spaces and ümlauts}
\\modulecredits{8}
  more context
EOF

describe Modul do
  context "In the latex extraction sample" do
    subject {Modul.from_latex latex_source}

    its(:name) {should eql "name with spaces and ümlauts"}
    its(:credits) {should eql 8}
  end
end
