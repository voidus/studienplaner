class Jsonizable < Module
  def initialize *keys
    @keys = keys
    define_to_json
  end

  def included mod
    mod.extend class_methods_module @keys
  end

  private

  def define_to_json
    keys = @keys
    define_method :to_json do |*a|
      hash = {'json_class' => self.class.name}
      keys.each do |a|
        hash[a.to_s] = send(a.to_sym)
      end
      hash.to_json(*a)
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
