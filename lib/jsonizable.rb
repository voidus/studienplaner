class Jsonizable < Module
  def initialize *keys
    @keys = keys
    define_as_json
  end

  def included mod
    mod.extend class_methods_module @keys
  end

  private

  def define_as_json
    keys = @keys
    define_method :as_json do |*a|
      hash = {'json_class' => self.class.name}
      keys.each do |a|
        hash[a.to_s] = self.send(a.to_sym)
      end
      hash
    end
  end

  def class_methods_module keys
    Module.new do
      define_method :json_create do |o|
        params = keys.map {|a| o[a.to_s]}
        new *params
      end
    end
  end
end
