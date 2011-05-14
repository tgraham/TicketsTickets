class TasksController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_user!
  before_filter :set_current_user
  before_filter :check_for_cancel, :only => [:create, :update]
  
  def index
    @tasks = Task.public
    @my_tasks = Task.private
  end
  
  def show
    @task = Task.where(:slug => params[:id]).first
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_path, :notice => 'Task created.'
    else
      render :new
    end
  end
  
  def edit
    @task = Task.where(:slug => params[:id]).first
  end
  
  def update
    @task = Task.where(:slug => params[:id]).first
    if @task.update_attributes(params[:task])
      redirect_to tasks_path, :notice => "#{@task.name} has been updated." and return
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end
  
  def destroy
    @task = Task.where(:slug => params[:id]).first
    if @task.destroy
      redirect_to tasks_path, :notice => "#{@task.name} has been removed."
    else
      redirect_to :back, :notice => "Something went wrong, try again."
    end
  end
  
  private

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to tasks_path, :notice => "You have canceled your request."
    end
  end
end
