class ProjectsController < ApplicationController
  before_action :set_project, only: %w[edit show update destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def update
    # binding.pry
    if @project.update(project_params)
      # binding.pry
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      redirect_to edit_project_path(@project), error: 'There was an error updating project'
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      redirect_to new_project_path, error: 'There was an error'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :start_date, tasks_attributes: [:id, :name, :deadline, :done, :_destroy])
  end
end
