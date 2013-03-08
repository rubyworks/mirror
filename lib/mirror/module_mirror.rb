module Mirror

  # Reflect on an object instance.
  #
  class ModuleMirror < Mirror

    def initialize(subject)
      @subject = subject
    end

    # Get class/module's real instance methods.
    #
    # @return [Array<Symbol>]
    def instance_methods(*a, &b)
      bind_call(Module, :instanance_methods, *a, &b)
    end

    # Get class/module's real public instance methods.
    #
    # @return [Array<Symbol>]
    def public_instance_methods(*a, &b)
      bind_call(Module, :public_instance_methods, *a, &b)
    end

    # Get class/module's real protected instance methods.
    #
    # @return [Array<Symbol>]
    def protected_instance_methods(*a, &b)
      bind_call(Module, :protected_instance_methods, *a, &b)
    end

    # Get class/module's real private instance methods.
    #
    # @return [Array<Symbol>]
    def private_instance_methods(*a, &b)
      bind_call(Module, :private_instance_methods, :class, *a, &b)
    end

    # Get list class/module's constants.
    #
    # @return [Array<Symbol>]
    def constants(*a, &b)
      bind_call(Module, :constants, *a, &b)
    end

  end

end
