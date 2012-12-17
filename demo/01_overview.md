# Real

## Overview

There is a problem in the realm of Ruby metaprogramming --objects
can be liers. You see, there is no guaruntee that the return value of 
a method is the "truth". Any object can play dirty tricks.

    string = "Watch this..."

    def string.class
      nil
    end

    string.class  #=> nil

We are never going to know what the *real* class of that object is
by asking it. So what can we do?

I've advocated for explict meta-programming methods be added to Ruby
for a long time. So far to no avail. Finally, I've decided I could 
at least provide my own library that provides the functionality.

    require 'real'

    $real.class(string)  #=> String

The use of global is just a reference to the `Real` module.

    Real.class(string)  #=> String

