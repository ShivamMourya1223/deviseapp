class PostsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_event,only: [:new]
	before_action :set_event1,only: [:edit,:update,:destroy]
  
  def index
     @posts = current_user.posts
  end

  def new
   @post =Post.new
  end

  def create
  	 @post = Post.create(post_params)
  	 redirect_to posts_path
  end

  def edit
  	#@post = Post.find(params[:id])
  end

  def update
  	 #@post = Post.find(params[:id])
  	 @post.update(post_params)
  	 redirect_to posts_path
  end
  

  def destroy
  	 #@post = Post.find(params[:id])
  	 @post.destroy
  	 redirect_to posts_path
   end

   def set_event
   	@user = User.find(params[:user_id])
   end

   def set_event1
   	@post = Post.find(params[:id])
   end










 
  def post_params
      params.require(:post).permit(:title,:description,:user_id)
    end
end
