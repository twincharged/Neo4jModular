require './app/forms/concerns/form_logic'

class UserCreationForm < FormLogic

attribute :first_name, String
attribute :last_name, String

attr_accessor :first_name, :last_name

# validates :first_name, :last_name, presence: true

private

  def persist!(attrs)
	User.create(attrs)
  end
end