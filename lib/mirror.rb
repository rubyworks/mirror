require 'mirror/mirror'
require 'mirror/instance_mirror'
require 'mirror/module_mirror'
require 'mirror/class_mirror'

module Mirror

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
      YAML.load_file(File.join(File.dirname(__FILE__), 'mirror.yml'))
    )
  end

  # Factory method to get the coresponding mirror for the given
  # subject.
  #
  # @todo Add cache?
  #
  # @return [Mirror]
  def self.[](subject)
    case subject
    when Class
      ClassMirror.new(subject)
    when Module
      ModuleMirror.new(subject)
    else
      InstanceMirror.new(subject)
    end
  end

end

