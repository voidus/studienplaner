require 'spec_helper'

describe DataMapper::Property::JsonArray do
  before do
    @cs = DataMapper::Property::JsonArray.new Studiengang, "property_name"
  end

  def store_receive val
    @cs.load(@cs.dump(val))
  end

  def store_receive_same val
    store_receive(val).should == val
  end

  it 'stores an empty array correctly' do
    store_receive_same([])
  end

  it 'retrieves an empty array for nil' do
    store_receive(nil).should == []
  end

  it 'retreives a single constraint' do
    store_receive_same([Constraints::Credits.new(4.4)])
  end
end

