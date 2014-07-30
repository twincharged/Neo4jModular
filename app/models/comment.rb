require './app/models/concerns/model_logic'
require 'active_model'

class Comment < ModelLogic

  attribute :name, String
  attribute :body, String
  attribute :public, Boolean
  attribute :youtube, String
  attribute :photo, String

  attr_accessor :name, :body, :public, :youtube, :photo

  define_model_callbacks :save, :delete
 


  def initialize(attrs)
    @name = attrs[:name]
    @body = attrs[:body]
    @youtube = attrs[:youtube]
    @photo = attrs[:photo]
  end


end