class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(article_params)
    @post.user_id = current_user.id 
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:post).permit(:title, :body)
  end
end
