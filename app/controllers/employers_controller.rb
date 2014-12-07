class EmployersController < ApplicationController

  before_action :authenticate_user!
  before_action :is_account_exists?, :except => :create

  before_action :is_admin, :only => :index


  def new
    @employer = Employer.new()
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      redirect_to employer_path(@employer)
      flash[:notice] = " employer information successfully saved"
    else
      redirect_to new_employer_path
      flash[:notice] = "unsuccessful"
    end
  end

  def index
    @employers = Employer.all
  end

  def destroy
    @employer = Employer.find(params[:id])
    @employer.destroy
    redirect_to employers_path
  end

  def edit
    if is_admin?
      @employer = Employer.find(params[:id])
    else
      @employer = current_user.employer
    end
  end

  def update
    @employer = Employer.find(params[:id])
    if @employer.update_attributes(employer_params)
      flash[:notice] = "Successfully updated"
      redirect_to employer_path(@employer)
    else
      flash[:error] = "Error while updating employer"
      render :edit
    end
    
  end

  def show
    if is_admin?
      @employer = Employer.find(params[:id])
    else
      @employer = current_user.employer
    end
  end

  private

  def employer_params
    params.require(:employer).permit(:user_id, :company_name, :website_url, :country, :state, :city, :contact_person, :contact_number, :contact_email, :full_address)
  end

end
