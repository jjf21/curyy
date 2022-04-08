class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[edit update destroy change_position]

  def new
    @experience = Experience.new(user: current_user, **experience_params)
  end

  def edit
  end

  def create
    if params[:use_template] == 'true'
      @experience = Experience.new_template(current_user, params[:item_type].to_s)
    else
      @experience = Experience.new(experience_params)
    end

    respond_to do |format|
      if @experience.save
        @experience.newly_created!
        format.html { redirect_to @experience, notice: "Experience créé" }
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

  def change_position
    if params[:direction] == "lower"
      @experience.move_lower
    elsif params[:direction] == "higher"
      @experience.move_higher
    end

    @higher_experience = @experience.higher_item
    @lower_experience = @experience.lower_item
    @direction = params[:direction]
    respond_to do |format|
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
