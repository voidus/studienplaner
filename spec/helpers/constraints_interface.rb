module ConstraintsInterface
  def self.included(mod)
    mod.module_eval do
      context "for the constraints interface" do
        its(:class) {should respond_to(:json_create)}

        %w[satisfied_by? fulfilled_message unfulfilled_message].each do |m|
          it {should respond_to(m.to_sym)}
        end

        its(:unfulfilled_message) {should be_a String}
        its(:fulfilled_message) {should be_a String}

        it {should be_eql_after_json}
      end
    end
  end
end
