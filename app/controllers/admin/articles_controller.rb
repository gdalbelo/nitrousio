class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout 'admin'

  # GET /articles
  def index
    @articles = Article.order(featured_at_home: :desc).order(featured: :desc).order(published_at: :desc).order(:title)
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to [:admin, @article], notice: 'Artigo salvo.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to [:admin, @article], notice: 'Artigo salvo.'
    else
      render action: 'edit'
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Artigo excluído.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :body, :published_at, :category_id, :image, :summary, :featured, :featured_at_home)
    end
end
