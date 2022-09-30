# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    @article = Article.friendly.find(params[:id])
    set_meta_tags title: @article.title, description: @article.description
  end
end
