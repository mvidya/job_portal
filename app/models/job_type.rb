class JobType < ActiveRecord::Base

  has_many :jobs, :dependent => :destroy
  
end
