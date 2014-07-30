require './app/repos/concerns/repo_logic'
require './app/repos/concerns/stores/user_store'


class UserRepo < RepoLogic


  def self.backend
  	UserStore.instance
  end
end