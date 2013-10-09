require 'spec_helper'

describe "Post pages" do

  describe "index" do
    let(:post_1) { FactoryGirl.create(:post) }

    it "should have the right title" do
      visit blog_path
      expect(page).to have_title("Eat Halal | On The Block")
    end

    context "The is one published post" do
      it "should display the post" do
        post_1
        visit blog_path
        expect(page).to have_text post_1.title
        expect(page).to have_text post_1.content 
      end      
    end
  end
end