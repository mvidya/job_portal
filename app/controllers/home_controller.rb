class HomeController < ApplicationController

  before_action :authenticate_user!, :is_account_exists?, :except => :index

  def index
    # UserMailer.welcome_email.deliver
    if current_user
      render :dashboard
    end
  end
  
end
