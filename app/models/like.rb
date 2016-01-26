class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :projects_liked, foreign_key: 'project_id', class_name: Project
end