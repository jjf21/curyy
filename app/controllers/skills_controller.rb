# frozen_string_literal: true

class SkillsController < ApplicationController
  before_action :set_skill, only: %i[edit update destroy]

  def new
    @skill = Skill.new(user: current_user, **skill_params)
  end

  def edit; end

  def create
    @skill = if params[:use_template] == "true"
               Skill.new_template(current_user, params[:item_type].to_s)
             else
               Skill.new(skill_params)
             end

    respond_to do |format|
      if @skill.save
        @skill.newly_created!
        format.html { redirect_to @skill }
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
        format.html { redirect_to skill_url(@skill) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url }
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
