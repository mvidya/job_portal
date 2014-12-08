class JobsController < ApplicationController

  before_action :authenticate_user!, :is_account_exists?

  before_action :is_employer, :only => [:new, :create, :edit, :update]

  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
      flash[:notice] = "information successfully saved"
    else
      redirect_to new_job_path
      flash[:error] = "unsuccessful"
    end
  end

  def index
    if is_employer?
      @jobs = current_user.employer.jobs
    else
      @jobs = Job.all
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  def edit
    @job = current_user.employer.jobs.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      flash[:notice] = "successfully updated"
      redirect_to job_path(@job)
    else
      flash[:error] = "Error while updating job"
      render :edit
    end
  end

  def show
    if is_employer?
      @job = current_user.employer.jobs.find(params[:id])
    else
     @job = Job.find(params[:id])
   end
 end

 def applied_jobs
  if is_admin?
    @job = Job.find(params[:id])
  else
    @job = current_user.employer.jobs.find(params[:id])
  end
  @applied_jobs = @job.applied_jobs
end

private

def job_params
  params.require(:job).permit(:employer_id, :job_type_id, :job_posted_on, :job_expires_on, :salary, :functional_area, :experience)
end

end
