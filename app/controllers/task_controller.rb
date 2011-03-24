class TaskController < ApplicationController
  before_filter :login_required
  before_filter :find_task, :except => [:index, :new, :create]
  
  def index
    @tasks = current_user.tasks
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      redirect_to(:controller => 'today')
    else
      flash[:notice] = @task.errors.full_messages.to_sentence
      redirect_to(:controller => 'today')
    end
  end
  
  def update
    @task.attributes= params[:task]
    @task.save!
    redirect_to(:action => "index")
  end
  
  def destroy
    @task.destroy
    redirect_to(:controller => "today", :action => "index")
  end
  
  def mark_complete 
    if @task.complete.nil? 
      @task.complete = Time.now 
      @task.todo.move_to_bottom 
    else 
      @task.complete = nil 
    end 
    @task.save! 
    @todos = current_user.schedule.todos
  end  
  protected
  def find_task
    @task = current_user.tasks.find(params[:id])
  end
end
