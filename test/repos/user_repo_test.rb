require 'minitest/autorun'
require './test/test_helper'

class UserRepoTest < MiniTest::Unit::TestCase

  # def setup
  # 	10.times {Factory.create(:user)}
  # end

  def new_user
    User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end

  def test_it_exists
    ur = UserRepo.new
    assert_kind_of UserRepo, ur
  end

  def test_repo_save
    u = self.new_user
    a = UserRepo.save(u)
    assert_kind_of Neography::Node, a
  end

  def test_kind
    u = UserRepo.save(self.new_user)
    n = UserRepo.find(u.id)
    assert_kind_of Neography::Node, n
  end

  def test_it_maintains_fields
    user = self.new_user
    u = UserRepo.save(user)
    n = UserRepo.find(u.id)
    assert_equal user.first_name, n.first_name
    assert_equal user.last_name, n.last_name
  end

######### Associations: Yup, these gonna be fun..... syke


  def test_follow_user
    
  end

  def test_followed_user
    
  end


######## etc


  def test_retrieve_all
    
  end

  def test_count_all
    
  end

  def test_find_first
    
  end

  def test_find_last
    
  end

  def test_update
    
  end

  def test_find
    
  end

  def test_find_by
    
  end

  def test_query
    
  end

  def test_sample
    
  end

  def test_empty
    
  end

  def test_graph
    
  end

  def test_graph_query
    
  end

  def test_lazy
    
  end

  def test_class
    
  end

  def test_backend
    
  end

end