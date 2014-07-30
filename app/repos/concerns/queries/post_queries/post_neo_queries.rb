module PostNeoQueries

  def find_by(hash, limit=1)
  	attrs = hash.collect {|k, v| "#{k}: #{v.inspect}"}*", "
  	return "Maximum objects that can be returned is 100." if limit > 100
  	cypher_query = "MATCH (u:#{self.object_class}{#{attrs}}) RETURN u LIMIT #{limit.to_i}"
  	results = neo.execute_query(cypher_query)
  	results.objectify_neo_data(limit)
  end

  
  Hash.class_eval do
    def objectify_neo_data(limit)
      results = self["data"]
      all_results = []
      results.each do |r|
        vertex = r[0]
        raise ArgumentError.new("syntax deprecated") if vertex.is_a?(Neography::Rest)
        vertex = vertex if (vertex.to_s.match(/^\d+$/) or vertex.to_s.split("/").last.match(/^\d+$/))
        if vertex
          object = Neography::Node.new(vertex)
          object.neo_server = @neo
          return object if limit == 1
          all_results << object
        end
      end
      all_results
    end
  end



  def where(hash, limit=10)
  	self.find_by(hash, limit)
  end

end