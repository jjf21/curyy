# frozen_string_literal: true

class CvsController < ApplicationController
  before_action :set_cv_and_theme_name, only: %i[show edit update destroy export]
  before_action :set_theme_name, only: %i[show edit export]

  def index
    @cvs = current_user.cvs
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    @theme = @cv.theme
  end

  def create
    @cv = Cv.new(user: current_user, theme: Theme.default_theme)
    if @cv.save
      redirect_to edit_cv_path(@cv)
    else
      redirect_to :cvs, error: "CV was not created"
    end
  end

  def update
    respond_to do |format|
      if @cv.update(cv_params)
        @theme_name = @cv.theme.name
        @theme = @cv.theme
        format.turbo_stream
        format.html { redirect_to cv_url(@cv) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cv.destroy
    respond_to do |format|
      format.html { redirect_to cvs_url }
      format.turbo_stream
    end
  end

  def export
    # TODO
    html = render_to_string partial: "/themes/hello_world", locals: { user: current_user, cv: @cv }, layout: false
    style_tag_options = [
      tailwind_stylesheet,
      { url: "https://css.gg/css" },
      { url: "https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" },
    ]
    grover = Grover.new("<html><head><meta charset='UTF-8' /></head><body>#{html}</body></html>", format: "A4", style_tag_options:)
    pdf = grover.to_pdf

    send_data pdf, type: "application/pdf"
  end

  private

  def cv_params
    params.require(:cv).permit(:theme_id, :header_bg, :body_bg, :body_bg_pattern, :font_size, :main_color, :text_color, :font_family)
  end

  def set_theme_name
    @cv = Cv.find(params[:id])
    @theme_name = @cv.theme.name
  end

  def set_cv_and_theme_name
    @cv = Cv.find(params[:id])
    @theme_name = @cv.theme.name
  end

  def tailwind_stylesheet
    if Rails.env.development?
      { content: Rails.application.assets["tailwind.css"].to_s }
    else
      path = Rails.application.assets_manifest.assets["tailwind.css"]
      { url: "#{request.protocol}#{request.host}/assets/#{path}" }
    end
  end
end
