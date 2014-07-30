Dir["./app/repos/concerns/stores/*.rb"].each {|file| require file }
Dir["./app/repos/concerns/adapters/*.rb"].each {|file| require file }
Dir["./app/repos/*.rb"].each {|file| require file }
require 'chassis'
require 'redis'
# require 'neo4j-core'

# Neo4j::Session.open(:embedded_db, '/usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db', auto_commit: true).start
#      f.register :neo4j, Neo4jRepo.new(Neo4j::Session.current)

classes = [PostStore.instance, UserStore.instance, CommentStore.instance, Chassis.repo]

classes.each do |f|
  f.register :neography, NeographyRepo.new(Neography::Rest.new)
  f.register :redis, Chassis::RedisRepo.new(Redis.new)
  f.register :memory, Chassis::MemoryRepo.new
  f.register :null, Chassis::NullRepo.new
end


# Choose backend for each object
# OPTIONS: (  :neography  :redis  :neo4j  :memory  :null_repo  :postgres  )

Chassis.repo.use :redis

UserStore.instance.use :redis

PostStore.instance.use :redis

CommentStore.instance.use :memory



repos = [PostRepo, UserRepo, CommentRepo]

repos.each do |c|
  case c.backend.implementation
  when Chassis::RedisRepo
  	 file = "./app/repos/concerns/queries/#{c.object_class.to_s.downcase}_queries/#{c.object_class.to_s.downcase}_redis_queries.rb"
  	 break unless File.file?(file)
     c.require file
     c.extend "#{c.object_class}RedisQueries".constantize
  when NeographyRepo
  	 file = "./app/repos/concerns/queries/#{c.object_class.to_s.downcase}_queries/#{c.object_class.to_s.downcase}_neo_queries.rb"
  	 break unless File.file?(file)
     c.require file
     c.extend "#{c.object_class}NeoQueries".constantize
  end
end