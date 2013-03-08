module Mirror

  # Reflect on an object instance.
  #
  class InstanceMirror < Mirror

    def initialize(subject)
      @subject = subject
    end

    # Get instance's id.
    #
    # @return [Integer]
    def id(*a, &b)
      bind_call(Object, :object_id, *a, &b)
    end

    # Get instance's class.
    #
    # @return [Class]
    def class(*a, &b)
      bind_call(Object, :class, *a, &b)
    end

    # Get a list of the subject's instance variables.
    #
    # @return [Array<Symbol>]
    def variables
      bind_call(Object, :instance_variables)
    end

    # Get a instance's state in the form of a mapping of instance
    # variable name to instance variable value.
    #
    # @todo Array, Hash, etc have "hidden" state that ultimately
    #       must be delt with specially.
    #
    # @return [Hash]
    def state
      s = {}
      variables.each do |v|
        s[v] = bind_call(Object, :instance_variable_get, v)
      end
      s
    end

    # Get instance variable value.
    #
    # @return [Object]
    def get(name)
      name = "@#{name}" unless name.to_s.start_with?('@')
      bind_call(Object, :instance_variable_get, name)
    end
    alias :[] :get

    # Set instance variable value.
    #
    # @return [Object]
    def set(name, value)
      name = "@#{name}" unless name.to_s.start_with?('@')
      bind_call(Object, :instance_variable_set, name, value)
    end
    alias :[]= :set

    # Get object's real methods.
    #
    # @return [Array<Symbol>]
    def methods(*a, &b)
      bind_call(Object, :methods, *a, &b)
    end

    # Get object's real public methods.
    #
    # @return [Array<Symbol>]
    def public_methods(*a, &b)
      bind_call(Object, :public_methods, *a, &b)
    end

    # Get object's real protected methods.
    #
    # @return [Array<Symbol>]
    def protected_methods(*a, &b)
      bind_call(Object, :protected_methods, *a, &b)
    end

    # Get object's real private methods.
    #
    # @return [Array<Symbol>]
    def private_methods(*a, &b)
      bind_call(Object, :private_methods, *a, &b)
    end

  end

end
