class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  respond_to :html
  respond_to :js

  def index
    @user = current_user
    if @user.soft_user?
      @tasks = Task.where(soft_token: @user.soft_token)
    else
      @tasks = @user.tasks.all
    end
    respond_with(@tasks)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @user = current_user
    @task = Task.new(task_params)

    if @user.soft_user?
      @task.soft_token = @user.soft_token
    end

    @task.save
    respond_with(@task)

  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

    def complete
      @task = Task.find(params[:id])
      @task.mark_complete!
    end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :completed, :user_id)
    end
end
