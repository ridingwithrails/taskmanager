module TodayHelper
  def sidebar_tasks(name) 
    tasklist = content_tag(:h1, "#{name.capitalize} Tasks") 
    for task in current_user.tasks.send(name) 
      tasklist += link_to image_tag('arrow_left.gif', :title => 'Do Today'), :controller => 'todo', :action => 'create', :id => task.id 
      tasklist += " #{task.name} " 
      tasklist += link_to image_tag('trash.gif', :title => 'Delete'), :controller => 'task', :action => 'destroy', :id => task.id 
      tasklist += content_tag(:span, "(Due #{task.due.to_s(:long)})", :class => 'duedate') 
    end 
    content_tag :div, tasklist, :class => "sidebar-tasks" 
  end 
end
