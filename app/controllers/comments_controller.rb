class CommentsController < ApplicationController
  #Destroy Assignment, remember that @topics can no longer be referenced
  #Must specify topic with @post.topic because no longer nested

  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = @post.comments.build(params.require(:comment).permit(:body).merge(user_id: current_user.id))
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Please try again, comment couldn't be deleted."
    end
    respond_to do |format|
       format.html
       format.js
    end
  end

  private
  def comment_params
    params.required(:comment).permit(:body)
  end
end
