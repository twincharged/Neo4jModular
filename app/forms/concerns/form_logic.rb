require 'chassis'
require 'active_model'

class FormLogic
	include Chassis.form
  include Chassis::Persistence
	include ActiveModel::Validations
  extend ActiveModel::Callbacks

  # def self.create(attrs)
	 #  self.new(attrs).construct(attrs)
  # end

  def construct(attrs)
    if valid?
    	persist!(attrs)
    	true
    else
    	errors.add(:base, "Invalid fields.")
    end
  end

end