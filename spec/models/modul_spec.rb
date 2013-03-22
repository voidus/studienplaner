#encoding: UTF-8
require 'spec_helper'

latex_source = <<EOF
some context
this shouldn't matter
  \\modulename{name with spaces and ümlauts}
\\modulecredits{8}
  more context
  Not a Stammmodul, do not confuse
EOF

describe Modul do
  context "In the latex extraction sample" do
    subject {Modul.from_latex latex_source}

    its(:valid?) {should be_true}
    its(:name) {should eql "name with spaces and ümlauts"}
    its(:credits) {should eql 8}
    its(:stammmodul?) {should be_false}
  end
end
