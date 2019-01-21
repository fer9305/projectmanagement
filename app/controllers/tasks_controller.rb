class TasksController < ApplicationController
  before_action :set_task, only: %w[show edit update destroy]

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@task), notice: 'Project was successfully updated.'
    else
      redirect_to edit_project_task_path(@task), error: 'There was an error updating project'
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@task.project), notice: 'Project was successfully destroyed.'
  end

  private

  def set_task
    @task = Task.find(params[:project_id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :deadline, :done,
                                 attachments_attributes: [:id, :file, :_destroy],
                                 user_tasks_attributes: [:id, :user_id, :_destroy])
  end
end
