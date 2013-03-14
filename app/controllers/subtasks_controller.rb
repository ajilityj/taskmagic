class SubtasksController < ApplicationController

  before_filter :authorize

  def index
    @subtasks = Subtask.all
  end

  def new
    @subtask = Subtask.new
    @task_id = params[:task_id]
  end

  def create
    @subtask = Subtask.new(params[:subtask])
    
    if @subtask.save
      redirect_to task_url(@subtask.task_id), notice: 'Subtask was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @subtask = Subtask.find(params[:id])
  end

  def edit
    @subtask = Subtask.find(params[:id])
  end

  def update
    @subtask = Subtask.find(params[:id])

    if @subtask.update_attributes(params[:subtask])
      redirect_to @subtask, notice: 'Subtask was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @subtask = Subtask.find(params[:id])
    @subtask.destroy

    redirect_to task_url(@subtask.task_id)
  end
end
