class EmployersController < ApplicationController


  def new
    @employer = Employer.new
  end

end
