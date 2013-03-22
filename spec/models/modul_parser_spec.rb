#encoding: UTF-8
require 'spec_helper'

latex_source = <<EOF
some context
this shouldn't matter
  \\modulename{name with spaces and ümlauts}
\\modulecredits{8}
  more context
  \\moduleID{IN3SOMETHING}
  Not a Stammmodul, do not confuse
EOF

describe ModulParser do
  context "In the latex extraction sample" do
    subject {Modul.from_latex latex_source}

    its(:valid?) {should be_true}
    its(:name) {should eql "name with spaces and ümlauts"}
    its(:credits) {should eql 8}
    its(:stammmodul?) {should be_false}
    its(:key) {should eql "IN3SOMETHING"}
  end

  context "with \"Dieses Modul ist ein Stammmodul.\"" do
    subject {Modul.from_latex("#{latex_source}\n\\begin{remarks}Dieses Modul ist ein Stammmodul.")}
    its(:stammmodul?) {should be_true}
  end

  context "with \"Das Modul \\emph{*name*} ist ein Stammmodul.\"" do
    subject do
      source = "#{latex_source}\n\\begin{remarks}Das Modul \\emph{name with spaces and ümlauts} ist ein Stammmodul."
      Modul.from_latex(source)
    end

    its(:stammmodul?) {should be_true}
  end

  context "with \"Das Modul \\emph{*name*  }ist ein Stammmodul.\"" do
    subject do
      source = "#{latex_source}\n\\begin{remarks}Das Modul \\emph{name with spaces and ümlauts}ist ein Stammmodul."
      Modul.from_latex(source)
    end

    its(:stammmodul?) {should be_true}
  end
end
