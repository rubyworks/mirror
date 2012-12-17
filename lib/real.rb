module Real
  extend self

  #####################
  # Object Reflection #
  #####################

  def id(*a, &b)
    bind_call(Object, :object_id, *a, &b)
  end

  def class(*a, &b)
    bind_call(Object, :class, *a, &b)
  end

  def methods(*a, &b)
    bind_call(Object, :methods, *a, &b)
  end

  def public_methods(*a, &b)
    bind_call(Object, :public_methods, *a, &b)
  end

  def protected_methods(*a, &b)
    bind_call(Object, :protected_methods, *a, &b)
  end

  def private_methods(*a, &b)
    bind_call(Object, :private_methods, *a, &b)
  end

  ###########################
  # Class/Module Reflection #
  ###########################

  def instance_methods(*a, &b)
    bind_call(Module, :instanance_methods, *a, &b)
  end

  def public_instance_methods(*a, &b)
    bind_call(Module, :public_instance_methods, *a, &b)
  end

  def protected_instance_methods(*a, &b)
    bind_call(Module, :protected_instance_methods, *a, &b)
  end

  def private_instance_methods(*a, &b)
    bind_call(Module, :private_instance_methods, :class, *a, &b)
  end

private

  def bind_call(c, m, o, *a, &b)
    im = c.instance_method(m) 
    im.bind(o).call(*a, &b)    
  end

  #
  # Access to project metadata, e.g. VERSION.
  #
  def self.const_missing(const_name)
    name = const_name.to_s.downcase
    index[name] || super(const_name)
  end

  #
  # Load project metadata file.
  #
  def self.index
    @index ||= (
      require 'yaml'
      YAML.load_file(File.join(File.dirname(__FILE__), 'real.yml'))
    )
  end
end

$real = Real

