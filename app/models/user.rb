class User < ActiveRecord::Base
  has_many :relationships, foreign_key: 'follower_id'

  has_many :followers, through: :relationships
  has_many :following, through: :relationships

  has_many :projects

  has_many :likes

  has_many :projects_liked, through: :likes

  def users_to_follow
    self.class.where.not(id: [id, *following.map(&:id)])
  end
end