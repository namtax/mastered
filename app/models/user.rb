class User < ActiveRecord::Base
  has_many :relationships, foreign_key: 'following_id'

  has_many :followers, through: :relationships
  has_many :following, through: :relationships
end