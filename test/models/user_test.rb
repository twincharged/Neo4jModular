require 'minitest/autorun'
require './test/test_helper'

class UserTest < MiniTest::Unit::TestCase


  def new_user
    User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end

  def test_first_name_present
    
  end

  def test_last_name_present
    
  end

  def test_avatar_present
    
  end

  def test_backdrop_present
    
  end

  def test_avatar_valid
    
  end

  def test_backdrop_valid
    
  end

  def test_university
    
  end

  def test_location
    
  end

  def test_gender
    
  end

  def test_birthday
    
  end


  def test_creation
    u = User.create(first_name: 'Joe', last_name: 'Ritchie')
    refute_nil u.id
  end

  def test_save
    u = self.new_user
    u.save
    refute_nil u.id
  end

  def test_included
    
  end

  def test_delete
    
  end

  def test_new_record
    
  end

  def test_repo
    
  end

end