class TasksController < ApplicationController

  before_filter :authorize
  
  def index
    @tasks = Task.order('priority asc, due_date desc').all
    @task = Task.new
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    # @task_ordered_after = @task.get_before(@task.priority, @task.due_date)

    if @task.save
      respond_to do |format|
        format.js
        format.html {redirect_to tasks_url}
      end
    else
      render 'new'
    end
  end
  
  def show
    @task = Task.find(params[:id])
    @subtask = Subtask.new
    @subtask.task_id = @task.id
  end
  
  def edit
    @task = Task.find(params[:id])

    respond_to do |format|
      format.js
      format.html {render 'edit'}
    end 
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
      redirect_to task_url(@task), notice: 'Task was successfully updated.'
    else
      render 'show'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end
end
