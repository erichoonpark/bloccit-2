require 'rails_helper'

 describe User do

   include TestFactories

   describe "#favorited(post)" do

     before do
      #Populate the test database with favorites
      @user = authenticated_user
      @post = associated_post
      sign_in @user
     end

     it "returns `nil` if the user has not favorited the post" do
       expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
       post :create, { post_id: @post.id }
       expect( @user.favorites.find_by_post_id(@post.id) ).to_not be_nil
     end

     it "returns the appropriate favorite if it exists" do
       expect( )
     end
   end
 end
