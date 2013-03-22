RSpec::Matchers.define :be_eql_after_json do
  match do |s|
    JSON.load(JSON.dump(s)) == s
  end
end
