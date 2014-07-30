require './app/repos/concerns/repo_logic'
require './app/repos/concerns/stores/post_store'


class PostRepo < RepoLogic



  def self.backend
  	PostStore.instance
  end

  def self.neo
  	@neo = Neography::Rest.new
  end
end