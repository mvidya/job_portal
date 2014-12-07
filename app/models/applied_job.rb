class AppliedJob < ActiveRecord::Base
  belongs_to :employee
  belongs_to :job

  validates :job_id, :employee_id, numericality: { only_integer: true }
end
