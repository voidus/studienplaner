#encoding: UTF-8
require 'spec_helper'

latex_source = <<EOF
some context
this shouldn't matter
  \\modulename{name with spaces and ümlauts}
\\modulecredits{8}
  more context
EOF

describe "ModulModel" do
  it "gets the module name from latex" do
    modul = Modul.from_latex latex_source
    modul.name.should == "name with spaces and ümlauts"
  end

  it "gets the credits from latex" do
    modul = Modul.from_latex latex_source
    modul.credits.should == 8
  end
end
