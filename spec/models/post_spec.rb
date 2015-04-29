require 'rails_helper'
#Referencing the gem for important enviro info

 describe Post do
   describe "vote methods" do
     #For description and grouping
     before do
       #Create objects and assign them to an instance variable before every spec
       @post = Post.create(title: 'post title', body: 'post body')
       3.times { @post.votes.create(value: 1) }
       2.times { @post.votes.create(value: -1) }
     end

     describe '#up_votes' do
       it "counts the number of votes with value = 1" do
         #It takes a string argument specifying the behavior 
         expect( @post.up_votes ).to eq(3)
       end
     end

     describe '#down_votes' do
       it "counts the number of votes with value = -1" do
         expect( @post.down_votes ).to eq(2)
       end
     end

     describe '#points' do
       it "returns the sum of all down and up votes" do
         expect( @post.points ).to eq(1) # 3 - 2
       end
     end
   end
 end
