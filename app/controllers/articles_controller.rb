class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #render gives a plain json output of the stuff that came form the form. good for debugging. 
    #render plain: params[:article].inspect
    
    #pull in the iels form the form to a new variable, 
    #and send them to the article params method for "whitelisting"
    #attempt to save, and reshow the new form if it fails. 
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article was successfully saved"
      redirect_to article_path(@article)
      #do something
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully saved"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    
    flash[:notice] =  "Article was deleted."
    redirect_to articles_path
      
  end
  
  
  
  private
  #this method "whitelists" the fields that we'll allow from the form.
  def article_params
    params.require(:article).permit(:title, :description)  
  end
  
  def set_article
      @article = Article.find(params[:id])
  end
  
end
