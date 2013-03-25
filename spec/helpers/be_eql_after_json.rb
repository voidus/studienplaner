RSpec::Matchers.define :be_eql_after_json do
  match do |s|
    @s = s
    JSON.load(JSON.dump(s)).eql? s
  end

  failure_message_for_should do |actual|
    "expected #{@s.inspect} to be eql after json dump-load\n\tgot     #{actual.inspect} instead"
  end

  description do
    "be the same object after JSON.dump and JSON.load"
  end
end
