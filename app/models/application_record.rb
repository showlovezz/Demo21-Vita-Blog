class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def admin?
  	self.role == "admin"
  end
  
end
