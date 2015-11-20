class PostsController < ApplicationController
  before_filter :authenticate_user!

  def post_like
    @user = current_user # before_action :authenticate_user, only: [:likes]
    @post = Post.find(params[:id])
    @user.toggle_like!(@post)

    if @user.likes?(@post) 
      redirect_to :back, notice: "You liked this post!"
    else
      redirect_to :back, notice: "You unliked this post!"
    end
  end

#!!!!
  def post_comment(post)
    @user = current_user # before_action :authenticate_user, only: [:likes]
    @post = post
    
    #if @user.likes?(@post) 
    #  redirect_to :back, notice: "You liked this post!"
    #else
    #  redirect_to :back, notice: "You unliked this post!"
    #end
  end

  def index
  	@posts = Post.all
  end

  def new 
  	@post = Post.new 
  end

  def edit 
  	@post = Post.find(params[:id]) 
  end

  def create 
    @post = Post.new(post_params.merge(user_id: current_user.id)) 
    
    if @post.save 
      redirect_to '/posts' 
    else 
      render 'new' 
    end 
  end

  def show
    @post = Post.find(params[:id])
  end
	
  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "post was deleted"
    redirect_to '/posts'
  end
	
  private 

  def post_params 
    params.require(:post).permit(:title, :text) 
  end

end
