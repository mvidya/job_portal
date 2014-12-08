class EmployeesController < ApplicationController

  before_action :authenticate_user!
  before_action :is_account_exists?, :except => :create

  before_action :is_admin, :only => :index


  def new
    @employee = Employee.new()
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee information successfully saved"
      redirect_to employee_path(@employee)
    else
      flash[:error] = "Error occurred while saving"
      render :new
    end
  end

  def index
    @employees = Employee.all()
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to new_employee_path
  end

  def edit
    if is_admin?
      @employee = Employee.find(params[:id])
    else
      @employee = current_user.employee
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      flash[:notice] = "Successfully Updated"
      redirect_to employee_path(@employee)
    else
      flash[:error] = "Error while updating employee"
      render :edit
    end
  end

  def show
    if is_admin?
      @employee = Employee.find(params[:id])
    else
      @employee = current_user.employee
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:user_id, :Fname, :Lname, :dob, :gender, :email, :ph_number, :state, :city, :address, :pin_code, :qualification, :univercity, :percentage, :document)
  end


end
