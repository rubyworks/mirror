# Mirror

[![Gem Version](https://badge.fury.io/rb/mirror.png)](http://badge.fury.io/rb/mirror)
[![Build Status](https://secure.travis-ci.org/rubyworks/mirror.png)](http://travis-ci.org/rubyworks/mirror) &nbsp; &nbsp;
[![Flattr Me](http://api.flattr.com/button/flattr-badge-large.png)](http://flattr.com/thing/324911/Rubyworks-Ruby-Development-Fund)

[Homepage](http://rubyworks.github.com/mirror) /
[Documentation](http://rubydoc.info/gems/mirror) /
[Support](http://github.com/rubyworks/mirror/issues) /
[Source Code](http://github.com/rubyworks/mirror)


There is a problem in the realm of Ruby metaprogramming" *objects can be liars*.
You see, there is no guaruntee that the return value of a method is the "truth".
Any object can play dirty tricks.

    string = "Watch this..."

    def string.class
      nil
    end

    string.class  #=> nil

We are never going to know what the *mirror* class of that object is
by asking it. So what can we do?

I've advocated for explict meta-programming methods be added to Ruby
for a long time. So far to no avail. Finally, I've decided I could 
at least provide my own library that provides the functionality.

    require 'mirror'

    Mirror[string].class  #=> String


### Installation

Putting the old RubyGems to work:

    $ gem install mirror


### Copyrights

Real is copyrighted open source software.

    Copyright (c) 2012 Rubyworks (BSD-2-Clause)

You many redistribute or modify this work in accordance with the **BSD-2-Clause** license.

See LICENSE.txt for details.
