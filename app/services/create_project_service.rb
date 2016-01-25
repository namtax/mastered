class CreateProjectService < ActiveInteraction::Base
  model :user
  string :name

  validates :name, presence: true

  def execute
    user.projects.create(name: name)
  end
end