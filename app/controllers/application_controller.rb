class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_id
  end

  def after_sign_in_path_for(user)
    role_name = user.role.name

    if role_name == "Job Seeker"

      if user.employee
        employee_dashboard_home_index_path
      else
        new_employee_path
      end

    elsif role_name == "Company"

      if user.employer  
        employer_dashboard_home_index_path
      else
        new_employer_path
      end

    elsif role_name == 'Admin'

      #root_to 'admin/index'

    end

  end

end
