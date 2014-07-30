require './app/models/concerns/model_logic'
require 'active_model'

class Post < ModelLogic

  attribute :body, String
  attribute :public, Boolean
  attribute :photo, String
  attribute :youtube, String

  attr_accessor :body, :public, :photo, :youtube

  define_model_callbacks :save, :delete


  def initialize(attrs)
    @body = attrs[:body]
    @public = attrs[:public]
    @photo = attrs[:photo]
    @youtube = attrs[:youtube]
  end

end