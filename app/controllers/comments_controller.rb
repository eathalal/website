class CommentsController < ApplicationController
  
  # filters
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@commentable.category.permalink, @commentable.permalink), notice: "Comment created."
    else
      render :new
    end
  end

private

  def load_commentable
    @commentable = Post.where(permalink: params[:post_id]).first
    # klass = [Post].detect { |c| params["#{c.name.underscore}_id"]}
    # @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def comment_params
      params.require(:comment).permit(:content)
    end
end
