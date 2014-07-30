require 'chassis'
require 'active_model'

class ModelLogic
  include Chassis.form
  include Chassis::Persistence
  include ActiveModel::Validations
  extend ActiveModel::Callbacks

  def save
  	run_callbacks :save do
  	  super
    end
  end

  def delete
  	run_callbacks :delete do
  	  super
    end
  end
end