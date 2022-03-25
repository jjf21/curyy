class PagesController < ApplicationController
  def root
  end

  def export
    html = render_to_string partial: '/themes/hello_world', locals: {user: User.first}, layout: false
    style_tag_options = [{ content: Rails.application.assets['application.css'].to_s }]
    grover = Grover.new("<html><body>#{html}</body></html>", format: 'A4', style_tag_options: style_tag_options)
    pdf = grover.to_pdf

    send_data pdf, type: "application/pdf"
  end
end