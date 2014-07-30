require './app/repos/concerns/repo_logic'
require './app/repos/concerns/stores/comment_store'


class CommentRepo < RepoLogic


  def self.backend
  	CommentStore.instance
  end
end