class AppliedJobsController < ApplicationController

  before_action :authenticate_user!, :is_account_exists?
  
  def new
    @applied_job = AppliedJob.new()
  end

  def create
    @applied_job = AppliedJob.new(applied_job_params)
    if @applied_job.save
      flash[:notice] = "Successfully applied"
      redirect_to jobs_path
    else
      flash[:error] = "Error occurred while aplying to job, please try again."
      redirect_to job_path(@applied_job.job_id)
    end
  end

  def index
    if is_employee?
     @applied_jobs = current_user.employee.applied_jobs
   elsif is_admin?
    @applied_jobs = AppliedJob.all
  else
    @applied_jobs = []
  end
end

  def show
    @applied_job = AppliedJob.find(params[:id])
  end

  private

  def applied_job_params
    params.require(:applied_job).permit(:employee_id, :job_id)
  end

end
