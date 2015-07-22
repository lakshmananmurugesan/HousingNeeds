class ArticlesController < ApplicationController
before_filter :authorize,only: [:edit,:update,:destroy,:index]
  def index
    @articles = Article.all.order("id desc")
    @article = Article.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    image1=params[:article][:photo]
    if !image1.nil? then
    image1=params[:article][:photo].original_filename
    @article.image = image1
    end
    if @article.save

      puts params[:checked]
      @check = params[:checked]
      if(@check[0].to_s == 'on') then
        puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"

        puts session[:user_mailid]
        UserMailer.sendMail(session[:user_mailid],@article).deliver
       end
      respond_to do |format|
        format.html { redirect_to articles_path , notice: 'Done, Post Added' }
      end
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def update
    @article=Article.find(params[:id])
    image1=params[:article][:photo]
    if !image1.nil? then
      image1=params[:article][:photo].original_filename
      @article.image = image1
    else
      @article.image = nil
    end
    if @article.update(article_params)
      respond_to do |format|
        format.html { redirect_to articles_path , notice: 'Post updation Success' }
      end
    else
      render 'edit'
    end
  end


  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    image1=params[:article][:photo]
   if !image1.nil? then
    image1=params[:article][:photo].original_filename
    directory = "public/PostImages"
    path = File.join(directory, image1)
    File.open(path, "wb") { |f| f.write(params[:article][:photo].read) }
    end
    params.require(:article).permit(:title, :text,:image,:checked)
  end

end
