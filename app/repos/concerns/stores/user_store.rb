require 'chassis'
require 'singleton'

class UserStore < Chassis::Repo
	include Singleton

end