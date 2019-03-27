class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.articles.search(params[:q])
    @articles = @q.result.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @article = current_user.articles.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      flash[:success] = "Article was successfully created."
      redirect_to @article
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated."
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Article was successfully destroyed."
    redirect_to articles_url
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :published, :published_at)
    end
end
