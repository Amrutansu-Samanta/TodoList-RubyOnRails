class RootController < ApplicationController

  def index
    @posts = Post.all
    render "index"
  end
  
  def contact
    render "contact"
  end

  def about
    render "about"
  end

  def jsonresponse
    @response = {
      :status => 707,
      :message => "Hello World"
    }
    render json: @response
  end

  def userdetails
    render json: params
  end

  def add
    @post = Post.new
    @post.title = params[:title]
    @post.description = params[:description]
    @post.save
    @posts = Post.all
    redirect_to "/index" , allow_other_host: true
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    @posts = Post.all
    redirect_to "/index" , allow_other_host: true
  end

  def search
    @query = params[:query]
    @posts = Post.where("posts.title LIKE ? OR posts.description LIKE ?", ["%#{@query}%"], ["%#{@query}%"])
    render "index"
  end

end
