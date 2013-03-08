# Mirror

## Overview

There is a problem in the realm of Ruby metaprogramming: *objects can be liers*.
You see, there is no guaruntee that the return value of a method is the "truth".
Any object can play dirty tricks.

    string = "Watch this..."

    def string.class
      nil
    end

    string.class  #=> nil

We are never going to know what the *real* class of that object is by asking it.
So what can we do?

Ultimately the best solution is for Ruby itself to support explicit 
meta-programming methods. But since this is notforthcoming, there is
luckily a trick we can use to provide endow a library with the ability.
The trick to get an UnboundMethod from Object (or Module as the case
may be), bind it to the object in question and then call it. In this way
we route around any possible overrides (beyond Object itself, of course).

    method = String.instance_method(:class)
    method.bind(string).call  #=> String

So the Mirror library uses this trick throughout to provided *real*
reflection on objects.

