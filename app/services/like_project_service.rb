class LikeProjectService < ActiveInteraction::Base
  model :user, class: User
  integer :project_id

  def execute
    user.likes.create(project_id: project_id)
  end
end