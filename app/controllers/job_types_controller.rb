class JobTypesController < ApplicationController

  before_action :authenticate_user!, :is_account_exists?
  before_action :is_admin
  
  def new
    @job_type = JobType.new()
  end

  def create
    @job_type = JobType.new(job_type_params)
    #@employer.user_id = current_user.id
    if @job_type.save
      flash[:notice] = "information successfully saved"
      redirect_to job_types_path
    else
      flash[:notice] = "unsuccessful"
      redirect_to new_job_type_path
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
    if @job_type.update_attributes(job_type_params)
      flash[:notice] = "successfully updated"
      redirect_to job_types_path
    else
      flash[:error] = "Error while updating"
      render :edit
    end
  end

  def show
    @job_type = JobType.find(params[:id])
  end

  private

  def job_type_params
    params.require(:job_type).permit(:type_name, :type_description)
  end

end
