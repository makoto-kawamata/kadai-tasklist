class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit]

    def index
        @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end

    def show
    end

    def new
      @task = Task.new
    end

    def create
      @task = current_user.tasks.new(task_params)
      if @task.save
        flash[:success] = 'Task を書き込んだお(^^)'
        redirect_to @task
      else
        flash.now[:danger] = 'Task を書き込めなかったお(´･ω･`)'
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されますた'
      redirect_to @task
      else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
      end
    end

    def destroy
      @task.destroy

      flash[:success] = 'おまえのやることは消えたお( ^ω^ )'
      redirect_to tasks_url
    end

    private

    def correct_user
      @tasklist = current_user.tasklists.find_by(id: params[:id])
      unless @tasklist
        redirect_to root_url
      end
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:content, :title)
    end
  end
