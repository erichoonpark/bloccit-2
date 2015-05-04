class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  after_save :update_post

  private

  def update_post
    post.update_rank
  end 
end
