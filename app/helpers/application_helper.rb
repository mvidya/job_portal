module ApplicationHelper

  def is_admin?
    Role.find_by(name: "Admin").id == current_user.role_id
  end

  def is_employer?
    Role.find_by(name: "Company").id == current_user.role_id
  end

  def is_employee?
    Role.find_by(name: "Job Seeker").id == current_user.role_id
  end
  
end
