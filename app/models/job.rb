class Job < ActiveRecord::Base
  
  belongs_to :employer
  belongs_to :job_type

  has_many :applied_jobs, :dependent => :destroy
  has_many :employees, :through => :applied_jobs

  validates :employer_id, :job_type_id, :salary, :experience, numericality: { only_integer: true }
  validates :job_posted_on, :job_expires_on, :functional_area, :presence => true

end
