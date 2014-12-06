class Job < ActiveRecord::Base
  
  belongs_to :employer
  belongs_to :job_type

end
