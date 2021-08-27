class CommentsController < ApplicationController

  before_action :find_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to @post, notice: "Your comment was posted!"
    else
      redirect_to @post, notice: "Something went wrong!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def find_post
    @post = Post.friendly.find(params[:post_id]) if params[:post_id]
  end
end
