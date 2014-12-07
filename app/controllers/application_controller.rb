class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_admin?
    Role.find_by(name: "Admin").id == current_user.role_id
  end

  def is_employer?
    Role.find_by(name: "Company").id == current_user.role_id
  end

  def is_employee?
    Role.find_by(name: "Job Seeker").id == current_user.role_id
  end

  def is_account_exists?

    if is_admin?
      return true
    elsif is_employer?
      if current_user.employer
        return true
      else
        flash[:error] = "Please setup your account before continuing"
        redirect_to new_employer_path if (params[:controller] != "employers" or params[:action] != "new")
      end
    else # Job Seeker or Employee by default
      if current_user.employee
        return true
      else
        flash[:error] = "Please setup your account before continuing"
        redirect_to new_employee_path if (params[:controller] != "employees" or params[:action] != "new")
      end
    end

  end

  def is_admin
    unless is_admin?
      flash[:error] = "Sorry you are not allowed to access that page."
      redirect_to root_path
    end
  end

  def is_employer
    unless is_employer?
      flash[:error] = "Sorry you are not allowed to access that page."
      redirect_to root_path
    end
  end

  def is_employee
    unless is_employee?
      flash[:error] = "Sorry you are not allowed to access that page."
      redirect_to root_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_id
  end

  def after_sign_in_path_for(user)
    # role_name = user.role.name

    if is_employee?

      if user.employee
        root_path
      else
        new_employee_path
      end

    elsif is_employer?

      if user.employer  
        root_path
      else
        new_employer_path
      end

    else #by default the user will be Admin

      root_path

    end

  end

end
