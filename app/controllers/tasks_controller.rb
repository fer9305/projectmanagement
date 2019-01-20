class TasksController < ApplicationController
  def show
    @task = Task.find(params[:project_id])
  end

  def edit
    @task = Task.find(params[:project_id])
  end

  def update
    @task = Task.find(params[:project_id])
    if @task.update(task_params)
      redirect_to project_task_path(@task), notice: 'Project was successfully updated.'
    else
      redirect_to edit_project_task_path(@task), error: 'There was an error updating project'
    end
  end

  def destroy
    @task = Task.find(params[:project_id])
    @task.destroy
    redirect_to project_path(@task.project), notice: 'Project was successfully destroyed.'
  end

  private

  def task_params
    params.require(:task).permit(:name, :deadline, :done, attachments_attributes: [:id, :file, :_destroy])
  end
end
