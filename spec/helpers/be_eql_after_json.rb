def to_json_and_back obj
  JSON.load(JSON.dump(obj))
end

RSpec::Matchers.define :be_eql_after_json do
  match do |subject|
    to_json_and_back(subject).eql? subject
  end

  failure_message_for_should do |subject|
    <<HERE
expected #{subject.inspect} to be eql after json dump-load
got      #{to_json_and_back(subject).inspect} instead"
HERE
  end

  failure_message_for_should_not do |subject|
    <<HERE
expected #{subject.inspect} not to be eql after json dump-load
(got     #{to_json_and_back(subject).inspect} after dump/load)"
HERE
  end

  description do
    "be the eql after JSON.dump and JSON.load"
  end
end
