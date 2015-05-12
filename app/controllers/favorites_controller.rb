class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    if favorite.save
      flash[:notice] = "Successly Favorited!"
      redirect_to [post.topic, post]
    else
      flash[:notice] = "We had some trouble. Please try again!"
      redirect_to [post.topic, post]
    end
  end

  def destroy
  post = Post.find(params[:post_id])
  favorite = current_user.favorites.find(params[:id])
   if favorite.destroy
     flash[:notice] = "Successly Unfavorited!"
     redirect_to [post.topic, post]
   else
     flash[:notice] = "We had some trouble. Please try again!"
     redirect_to [post.topic, post]
   end
 end
end
