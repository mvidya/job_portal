class Job < ActiveRecord::Base
  
  has_many :job_types, :dependent => :destroy
  belongs_to :employer

end
