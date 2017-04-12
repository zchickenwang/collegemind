class ArticlesController < ApplicationController
    include ArticlesHelper
    before_filter :require_login, except: [:index, :show]
    add_breadcrumb "index", '/'

    def index
        @articles = Article.all
        @tags = []
        for curr in Tag.all
            if curr.articles.size > 0
                @tags.push(curr)
            end
        end
    end

    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
        add_breadcrumb @article.title, article_path(@article)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save

        flash.now[:alert] = "Article '#{@article.title}' Created!"
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        flash.now[:alert] = "Article '#{@article.title}' Destroyed!"
        redirect_to articles_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.now[:alert] = "Article '#{@article.title}' Updated!"
        redirect_to article_path(@article)
    end

end
