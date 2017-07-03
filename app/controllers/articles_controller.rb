class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # fail
    @article = Article.new(article_params) # article_params perform check, we included this
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    # needs redirect if no view for this action
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id]).destroy

    flash.notice = "Article '#{@article.title}' Destroyed!"

    redirect_to articles_path
  end
end
