class ScamArticlesController < ApplicationController

    before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

    def index
      @scam_articles = ScamArticle.all
    end
  
    def show
      @scam_article = ScamArticle.find(params[:id])
    end
  
    def new
      @scam_article = ScamArticle.new
    end
  
    def create
      @scam_article = ScamArticle.new(scam_article_params)
      if @scam_article.save
        flash[:notice] = "#{@scam_article.title} was successfully created."
        redirect_to @scam_article
      else
        render :new
      end
    end
  
    def edit
      @scam_article = ScamArticle.find(params[:id])
    end
  
    def update
      @scam_article = ScamArticle.find(params[:id])
      if @scam_article.update(scam_article_params)
        flash[:notice] = "#{@scam_article.title} was successfully updated."
        redirect_to @scam_article
      else
        render :edit
      end
    end
  
    def destroy
      @scam_article = ScamArticle.find(params[:id])
      @scam_article.destroy
      redirect_to scam_articles_path
    end
  
    private

    def check_admin
        unless current_user&.is_admin
          flash[:warning] = "You are not authorized to perform this action."
          redirect_to scam_articles_path
        end
    end
  
    def scam_article_params
      params.require(:scam_article).permit(:title, :body, :author, :published_at, :category)
    end
  end
  