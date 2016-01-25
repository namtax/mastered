class FollowUserService < ActiveInteraction::Base
  model :user
  model :follower, class: User

  def execute
    follower.relationships
      .create(following_id: user.id)
  end
end