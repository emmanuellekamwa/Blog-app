class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id

    end

    before_action :require_login, only: [:new]
    def new
        @article = Article.new
    end

    before_action :require_login, except: [:destroy]
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
      
        redirect_to articles_path
    end

    before_action :require_login, only: [:create]
    def create
        @article = Article.new(params[:article])
        @article.save
        redirect_to article_path(@article)

    end

    before_action :require_login, only: [:update]
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        
        redirect_to article_path(@article)
    end
      
    before_action :require_login, only: [:edit]
    def edit
        @article = Article.find(params[:id])
    end
      
end
