class TasksController < ApplicationController

  before_filter :require_login
  
  def index
    if params[:user_id]
      @tasks = Task.order('priority asc, due_date desc').where(:user_id => params[:user_id])
    else
      @tasks = Task.order('priority asc, due_date desc').all
    end
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
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
      respond_to do |format|
        format.js
        format.html {redirect_to tasks_url}
      end
    else
      render 'show'
    end
  end
  
  def destroy
    @task = Task.destroy(params[:id])

    respond_to do |format|
      format.js
      format.html {redirect_to tasks_url}
    end
  end

  def calendar
    @tasks = Task.all
    @tasks_by_date = @tasks.group_by(&:due_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

end
