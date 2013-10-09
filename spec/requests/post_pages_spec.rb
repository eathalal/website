require 'spec_helper'

describe "Post pages" do

  describe "index" do

    it "should have the right title" do
      visit blog_path
      expect(page).to have_title("Eat Halal | On The Block")
    end
  end
end