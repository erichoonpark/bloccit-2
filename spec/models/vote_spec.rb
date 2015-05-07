require 'rails_helper'

describe Vote do
  include TestFactories
  
  describe "validations" do
    before do
      @user = User.new(email: 'admin11@example.com', password: 'helloworld', password_confirmation: 'helloworld')
      @user.skip_confirmation!
      @user.save!
      #create post
      @post = Post.create(title: 'test title', body: 'test post body that is long enough', user: @user, topic_id: 37)
      @vote = Vote.create(value: 1, post: @post, user: @user)
    end
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@vote.value).to eq(1 || -1)
      end
    end
  end

  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end
