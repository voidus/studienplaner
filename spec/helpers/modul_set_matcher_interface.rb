module ModulSetMatcherInterface
  def self.included(mod)
    mod.module_eval do
      context "for the ModulSetMatcher interface" do
        it {should respond_to :matches?}
      end
    end
  end
end
