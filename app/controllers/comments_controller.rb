class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.build(params.require(:comment).permit(:body).merge(user_id: current_user.id))
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@topic,@post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic,@post]
    else
      flash[:error] = "Please try again, comment couldn't be deleted."
      redirect_to [@topic,@post]
    end
  end
end
