require 'redis'

REDIS = Redis.new

module UserRedisQueries

  def create_follow(follower, followee)
    REDIS.sadd("user:#{follower.id}:follows", followee.id)
    REDIS.sadd("user:#{followee.id}:followers", follower.id)
  end

  def followers_list(followee)
  	ids = REDIS.smembers("user:#{followee.id}:followers")
  	followers = []
  	ids.each do |f|
      u = self.find(f.to_i)
      followers << u
    end
    return followers
  end

  def follows_list(follower)
  	ids = REDIS.smembers("user:#{follower.id}:follows")
  	follows = []
  	ids.each do |f|
      u = self.find(f.to_i)
      follows << u
    end
    return follows
  end



end