class JobTypesController < ApplicationController
  def new
    @job_type = JobType.new()
  end

  def create
    @job_type = JobType.new(job_type_params)
    #@employer.user_id = current_user.id
    if @job_type.save
      redirect_to job_types_path
      flash[:notice] = " employer information successfully saved"
    else
      redirect_to new_job_type_path
      flash[:notice] = "unsuccessful"
    end
  end

  def index
    @job_types = JobType.all()
  end

  def destroy
    @job_type = JobType.find(params[:id])
    @job_type.destroy
    redirect_to job_types_path
  end

  def edit
    @job_type = JobType.find(params[:id])
  end

  def update
    @job_type = JobType.find(params[:id])
    @job_type.update_attributes(job_type_params)
    redirect_to job_types_path
  end

  def show
    @job_type = JobType.find(params[:id])
  end

  private

  def job_type_params
    params.require(:job_type).permit(:type_name, :type_description)
  end

end
