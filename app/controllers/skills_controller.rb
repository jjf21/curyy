class SkillsController < ApplicationController
  before_action :set_skill, only: %i[edit update destroy]

  def new
    @skill = Skill.new(user: current_user, **skill_params)
  end

  def edit
  end

  def create
    @skill = Skill.new(skill_params)
    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: "Skill was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.turbo_stream
    end
  end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.turbo_stream
        format.html { redirect_to skill_url(@skill), notice: "Skill was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: "Skill was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:user_id, :name, :level, :certification, :item_type)
  end
end
