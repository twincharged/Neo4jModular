require 'rubygems'
require 'neo4j-core'
require 'debugger'
require 'json'

class Neo4jRepo < Chassis::BaseRepo

    class Neo4jMap
      def initialize(neo)
        @neo4j = neo
      end

      def clear
      end

      def all(klass)
      end

      def get(klass, id)
      end

      def set(record)
        node = Neo4j::Node.create(record, record.class.to_sym)
        return node
      end

      def delete(record)
      end

      private

      def neo
        @neo4j ||= Neo4j::Session.current
      end
    end

  def initialize(neo)
    @map = Neo4jMap.new(neo)
  end

end