class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[edit update destroy]

  def new
    @experience = Experience.new(user: current_user)
  end

  def edit
  end

  def create
    @experience = Experience.new(experience_params)
    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: "Experience was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.turbo_stream
    end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.turbo_stream
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:user_id, :start_date, :end_date, :current, :title, :description, :company, :location, :item_type)
  end
end
