require 'rubygems'
require 'neography'

module Chassis
class NeoAdapter < Chassis::BaseRepo
  class NeoMapper
    attr_reader :klass, :neo

    def initialize(klass, neo)
      @klass, @neo = klass, neo
    end

    def []=(id, obj)
      map = read
      map[id.to_s] = obj

      write map
    end

    def [](id)
      read[id.to_s]
    end

    def values
      read.values
    end

    def delete(id)
      map = read
      map.delete id.to_s
      write map
    end

    def count
      read.count
    end

    private
    def read
      # value = Neography::Node.load(key, @neo)
      value ? Marshal.load(value) : { }
    end

    def write(map)
      neo.set key, Marshal.dump(map)
    end

    def key
      klass.to_s
    end
  end

  def initialize(neo)
    @neo = neo
  end

  def clear
    neo.flushall
  end

  def map_for_class(klass)
    Neography::Rest.new klass, neo
  end

  private
  def neo
    @neo ||= Neography::Rest.new
  end
end
end