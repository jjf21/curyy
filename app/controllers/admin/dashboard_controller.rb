class Admin::DashboardController < Admin::ApplicationController
  def index
    @users = User.all
    @cvs = Cv.all
    @visits = Ahoy::Visit.all
    @events = Ahoy::Event.all
  end
end
