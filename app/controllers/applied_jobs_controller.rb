class AppliedJobsController < ApplicationController
  def new
    @applied_job = AppliedJob.new()
  end

  def create
    @applied_job = AppliedJob.new(applied_job_params)
    #@employer.user_id = current_user.id
    if @applied_job.save
      redirect_to applied_job_path(@applied_job)
      flash[:notice] = " employer information successfully saved"
    else
      redirect_to new_job_type_path
      flash[:notice] = "unsuccessful"
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
