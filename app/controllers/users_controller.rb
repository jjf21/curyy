class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.turbo_stream
        format.html { redirect_to user_url(@user) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthdate, :phone, :address, :headline, :about, :website, :interests, :cv_email)
  end
end
