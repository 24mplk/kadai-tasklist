class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task =Task.new(content: 'Get them done!')
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Successfully posted.'
      redirect_to @task
    else
      flash.now[:danger] = 'Could not posted.'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Successfully edited.'
      redirect_to @task
    else
      flash.now[:danger] = 'Could not edited.'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'Successfully deleted.'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  
  def set_task
    @task =Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  
  
end
