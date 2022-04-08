class CvsController < ApplicationController
  before_action :set_cv, only: %i[show edit update destroy export]
  before_action :set_theme_name, only: %i[show edit export]

  def index
    @cvs = current_user.cvs
  end

  def show
    @user = current_user
    @theme = @cv.theme
  end

  def edit
  end

  def create
    @cv = Cv.new(user: current_user, theme: Theme.default_theme)
    if @cv.save
      redirect_to @cv, notice: "Cv créé"
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
        format.html { redirect_to cv_url(@cv), notice: "Cv was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cv.destroy
    respond_to do |format|
      format.html { redirect_to cvs_url, notice: "Cv was successfully destroyed." }
      format.turbo_stream
    end
  end

  def export
    html = render_to_string partial: '/themes/hello_world', locals: {user: current_user, cv: @cv}, layout: false
    style_tag_options = [{ content: Rails.application.assets['tailwind.css'].to_s }, { url: 'https://css.gg/css'}]
    grover = Grover.new("<html><head><meta charset='UTF-8' /></head><body>#{html}</body></html>", format: 'A4', style_tag_options: style_tag_options)
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

  def set_cv
    @cv = Cv.find(params[:id])
    @theme_name = @cv.theme.name
  end

end
