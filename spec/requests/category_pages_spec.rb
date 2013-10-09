require 'spec_helper'

describe "Category pages" do

  describe "index" do

    it "should have the content 'Eat Halal'" do
      visit root_path
      expect(page).to have_content('Eat Halal')
    end

    it "should have the right title" do
  		visit root_path
  		expect(page).to have_title("Eat Halal")
      expect(page).to_not have_title("|")
		end
  end
end


