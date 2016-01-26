class ProjectsController < ApplicationController
  def create
    outcome = CreateProjectService.run(user: current_user, name: params[:name])

    if outcome.valid?
      redirect_to user_path(id: current_user.name)
    else
      flash[:warning] = outcome.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

  def show
    @project = Project.find_by(name: params[:id])
  end

  def favourite
    project = Project.find_by(name: params[:id])
    outcome = LikeProjectService.run(user: current_user, project_id: project.id)

    if outcome.valid?
      flash[:success] = "You added #{project.name} to your favourites"
      redirect_to project_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
