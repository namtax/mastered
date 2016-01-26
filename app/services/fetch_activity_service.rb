class FetchActivityService < ActiveInteraction::Base
  model :user

  def execute
    activities
      .sort_by{ |x| x.created_at }
      .reverse
  end

  def activities
    user.following.flat_map do |u|
      u.relationships + u.likes + u.projects
    end
  end
end