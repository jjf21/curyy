module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    def check_admin
      redirect_to root_path if !current_user.admin?
    end

  end
end
