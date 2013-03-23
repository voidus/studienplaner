module ModulSetMatcherInterface
  def self.included(mod)
    mod.module_eval do
      context "for the ModulSetMatcher interface" do
        it {should respond_to :matches?}
        it {should be_eql_after_json}
      end
    end
  end
end
