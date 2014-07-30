# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'rake/testtask'
# require 'neo4j/tasks/neo4j_server'


Rake::TestTask.new do |t|
  t.pattern = "test/forms/*_test.rb"
  t.pattern = "test/models/*_test.rb"
  t.pattern = "test/repos/*_test.rb"

end