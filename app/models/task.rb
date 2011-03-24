class Task < ActiveRecord::Base
  belongs_to :user
  has_one :todo, :dependent => true
  
  def due_date
    due.to_s
  end
  
  def due_date=(str)
    self.due = Chronic.parse(str).to_date.to_s
    
    rescue  
      @invalid_date = true
  end
  
  def validate
    errors.add :due_date, 'is not a valid date' if @invalid_date 
  end
end
