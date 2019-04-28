class ArticlesController < ApplicationController

  def new
  	@article  = Article.new
  end

  def create
  	# render plain: params[:article].inspect
  	@article = Article.new(article_params)
  	if @article.save
  	  flash[:notice] = "Article was successfully created"
  	  redirect_to article_path(@article) #gives it somewhere to go after the insert
  	else
  	  render 'new' # re-dislay the new article form
  	end
  	  	
  end

  def show
  	@article = Article.find(params[:id])
  end

  private
  def article_params
  	params.require(:article).permit(:title, :description)

  end

end
