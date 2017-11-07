class ArticlesController < ApplicationController
  
  def index
    
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #render gives a plain json output of the stuff that came form the form. good for debugging. 
    #render plain: params[:article].inspect
    
    #pull in the iels form the form to a new variable, 
    #and send them to the article params method for "whitelisting"
    @article= Article.new(article_params)
    @article.save
    
    #redirexct to the show method with the article ID of the article. 
    redirect_to articles_show(@article)
  end
  
  private
  #this method "whitelists" the fields that we'll allow from the form.
  def article_params
    params.require(:article).permit(:title, :description)  
  end
  
  
end
