# Mirror Module

The toplevel Mirror module provides a single method `#[]` that is the 
primary interface. It is a factory methods and returns the coresponding
mirror instance for a given object to be reflected upon.

    Mirror["string"].object_class    #=> Mirror::InstanceMirror

    Mirror[String].object_class      #=> Mirror::ClassMirror

    Mirror[Enumerable].object_class  #=> Mirror::ModuleMirror


