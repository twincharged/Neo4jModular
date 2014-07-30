require './app/models/concerns/model_logic'
require 'active_model'

class User < ModelLogic

  attribute :first_name, String
  attribute :last_name, String
  attribute :gender, String
  attribute :description, String
  attribute :entity, Boolean
  attribute :moderator, Boolean
  attribute :deactivated, Boolean
  attribute :avatar, String
  attribute :backdrop, String

  attr_accessor :first_name, :last_name, :gender, :description, :entity, :moderator, :deactivated, :avatar, :backdrop

  define_model_callbacks :save, :delete



  def initialize(attrs)
    @first_name = attrs[:first_name]
    @last_name = attrs[:last_name]
    @gender = attrs[:gender]
    @description = attrs[:description]
    @entity = attrs[:entity]
    @moderator = attrs[:moderator]
    @deactivated = attrs[:deactivated]
    @avatar = attrs[:avatar]
    @avatar = attrs[:backdrop]
  end



  def follow(other_user)
    self.class.repo.create_follow(self, other_user)
  end

  def followers
    self.class.repo.followers_list(self)
  end

  def follows
    self.class.repo.follows_list(self)
  end

end