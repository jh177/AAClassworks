class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do 
        self.instance_variable_get("@#{name}".to_sym)
      end
      setter = "#{name.to_s}=".to_sym
      define_method(setter) do |*args|
        self.instance_variable_set("@#{name}".to_sym, *args)
      end
    end
  end
end
