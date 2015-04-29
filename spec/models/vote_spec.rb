describe Vote do     #Specifying the class
  describe "validations" do


    describe "value validation" do
      it "only allows -1 or 1 as values" do     #Taking a descriptive string argument
        expect (@post.votes).to eq(1 || -1)
      end
    end
  end
end
