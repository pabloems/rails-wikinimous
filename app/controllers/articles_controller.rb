class ArticlesController < ApplicationController
   before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
  @article = Article.new
  end
  
  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to article_index_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :details)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
