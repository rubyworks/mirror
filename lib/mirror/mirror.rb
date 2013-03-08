module Mirror

  # Base class for all other mirror classes.
  class Mirror

    # B/c mirror's override #class.
    alias :object_class :class

  private

    def bind_call(c, m, *a, &b)
      im = c.instance_method(m) 
      im.bind(@subject).call(*a, &b)    
    end

  end

end
