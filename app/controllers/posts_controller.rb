class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
  end

  def show
    @category = Category.where(permalink: params[:category]).first
    @post = @category.posts.where(permalink: params[:permalink]).first
  end
end
