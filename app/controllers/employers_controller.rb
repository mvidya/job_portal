class EmployersController < ApplicationController


  def new
    @employer = Employer.new()
  end

  def create
    @employer = Employer.new(employer_params)
    #@employer.user_id = current_user.id
    if @employer.save
      redirect_to employer_path(@employer)
      flash[:notice] = " employer information successfully saved"
    else
      redirect_to new_employer_path
      flash[:notice] = "unsuccessful"
    end
  end

  def index
    @employers = Employer.all()
  end

  def destroy
    @employer = Employer.find(params[:id])
    @employer.destroy
    redirect_to new_employer_path
  end

  def edit
    @employer = Employer.find(params[:id])
  end

  def update
    @employer = Employer.find(params[:id])
    @employer.update_attributes(employer_params)
    redirect_to employer_path(@employer)
  end

  def show
    @employer = Employer.find(params[:id])
  end

  private

  def employer_params
    params.require(:employer).permit(:user_id, :company_name, :website_url, :country, :state, :city, :contact_person, :contact_number, :ontact_email, :full_address)
  end

end
