require 'chassis'
require 'singleton'

class CommentStore < Chassis::Repo
	include Singleton

end