class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Task を書き込んだお(^^)'
      redirect_to @task
    else
      flash.now[:danger] = 'Task を書き込めなかったお(´･ω･`)'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  @task = Task.find(params[:id])

    if @task.update(task_params)
    flash[:success] = 'Task は正常に更新されますた'
    redirect_to @task
    else
    flash.now[:danger] = 'Task は更新されませんでした'
    render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end
