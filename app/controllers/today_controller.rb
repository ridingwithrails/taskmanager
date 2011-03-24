class TodayController < ApplicationController
  before_filter :login_required
  before_filter :find_schedule
  
  def index
    @todos = @today.todos
  end
  
  def sort
    @today.todos.each do |todo| 
      todo.position = params['todo-list'].index(todo.id.to_s) + 1 
      todo.save 
    end 
    render :nothing => true 
  end
  
  protected
  def find_schedule
    @today = current_user.schedule || current_user.create_schedule(:today => Date.today.to_s)
  end
end
