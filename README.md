<div align="right">
[![Build Status](https://secure.travis-ci.org/rubyworks/bang.png)](http://travis-ci.org/rubyworks/real)
</div>

[Homepage](http://rubyworks.github.com/real) |
[Support](http://github.com/rubyworks/real/issues) |
[Source Code](http://github.com/rubyworks/real)


# Real

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


### Installation

Putting the old RubyGems to work:

    $ gem install real


### Copyrights

Real is copyrighted open source software.

    Copyright (c) 2012 Rubyworks (BSD-2-Clause)

You many redistribute or modify this work in accordance with the **BSD-2-Clause** license.

See LICENSE.txt for details.
