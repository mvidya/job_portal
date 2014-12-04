class EmployeesController < ApplicationController
  def new
    @employee = Employee.new()
  end

  def create
    @employee = Employee.new(employee_params)
    #@employer.user_id = current_user.id
    if @employee.save
      redirect_to employee_path(@employee)
      flash[:notice] = " employer information successfully saved"
    else
      redirect_to new_employee_path
      flash[:notice] = "unsuccessful"
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
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update_attributes(employee_params)
    redirect_to employee_path(@employee)
  end

  def show
    @employee = Employee.find(params[:id])
  end

  private

  def employee_params
    params.require(:employee).permit(:user_id, :Fname, :Lname, :dob, :gender, :email, :ph_number, :state, :city, :address, :pin_code, :qualification, :univercity, :percentage)
  end


end
