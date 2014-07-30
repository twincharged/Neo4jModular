require 'rubygems'
require 'neography'
require 'debugger'
require 'json'
require 'chassis'

class NeographyRepo < Chassis::BaseRepo

    class NeoMap

      def initialize(neo)
        @neo = neo
      end


      def clear
        if Rails.env.test? || Rails.env.development?
          count = execute_query("MATCH (n) OPTIONAL MATCH (n)-[r1]-() DELETE  n,r1")
        else
          raise "Cannot wipe the graph DB unless in test environment"
        end
      end


      def all(klass)
        cypher_query = "MATCH (n:#{klass}) RETURN n"
        results = @neo.execute_query(cypher_query)
        results = results["data"]
        all_results = []
        results.each do |r|
          vertex = r[0]
          raise ArgumentError.new("syntax deprecated") if vertex.is_a?(Neography::Rest)
          vertex = vertex if (vertex.to_s.match(/^\d+$/) or vertex.to_s.split("/").last.match(/^\d+$/))
          if vertex
            object = Neography::Node.new(vertex)
            object.neo_server = @neo
            all_results << object
          end
        end
        all_results
      end


      def get(klass, id)
        node = Neography::Node.load(id, @neo)
        if node.labels.include?(klass.to_s)
          hash = node.to_h
          hash[:id] = node.id
          object = klass.allocate
          object.attributes = hash
          return object
        else
          p "Found a node with these labels: #{node.labels}"
          raise Neography::NodeNotFoundException
        end
      end


      def set(record)
        # if record.neo_id.present?
          
        # else
          hash = {}
          record.instance_variables.each {|var| hash[var.to_s.delete("@").to_sym] = record.instance_variable_get(var) }
          hash.delete(:id)
          node = Neography::Node.create(hash, @neo)
          @neo.add_label(node, record.class.to_s)     ### This needs to change to single atomic method
          return node
        # end
      end

        ### if hash.entity == true
        ### lab = "Entity"              then add 'lab' to labels & delete hash.entity before creating

      def delete(record)
        record.del
      end


      Neography::Node.class_eval do
        def id
          neo_id.to_i
        end
      end
      

      private

      def neo
        @neo ||= Neography::Rest.new
      end
    end

  def initialize(neo)
    @map = NeoMap.new(neo)
  end
end
