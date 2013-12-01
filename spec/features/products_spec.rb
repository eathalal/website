require 'spec_helper'

feature "Admin adds a new product" do
  given(:admin) { FactoryGirl.create(:admin) }
  background do 
    sign_in admin
    visit new_admin_product_path
  end

  scenario "with valid information" do
    fill_in "Name",        with: "Name"
    fill_in "Description", with: "MyDescription"
    fill_in "Price",       with: 1.00
    click_button "Create Product"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Product | Name"
    expect(page).to have_text "MyDescription"
  end

  scenario "with invalid information" do
    click_button "Create Product"
    expect(page).to have_danger_message
    expect(page).to have_title "Eat Halal | Product | New"
  end
end

feature "Admin edits a product" do
  given(:product) { FactoryGirl.create(:product) }
  given(:admin) { FactoryGirl.create(:admin) }

  background do
    sign_in admin
    visit edit_admin_product_path(product)
  end

  scenario "with valid information" do
    fill_in "Name", with: "NewName"
    fill_in "Description", with: "NewDescription"
    click_button "Update Product"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Product | NewName"
    expect(page).to have_text "NewDescription"
  end

  scenario "with invalid information" do
    fill_in "Description", with: "  "
    click_button "Update Product"
    expect(page).to have_danger_message
    expect(page).to have_title "Eat Halal | Product | Edit #{product.name}"
  end
end

feature "Admin views product index" do
  given(:product) { FactoryGirl.create(:product) }
  given(:admin) { FactoryGirl.create(:admin) }

  background { sign_in admin }

  scenario "with no products" do
    visit admin_products_path
    expect(page).to have_title "Eat Halal | Products"
    expect(page).to have_text "No products have been added."
  end

  scenario "with one product" do
    product
    visit admin_products_path
    expect(page).to have_title "Eat Halal | Products"
    expect(page).to have_text product.id
    expect(page).to have_text product.name
    expect(page).to have_text product.description
    expect(page).to have_text product.price
  end
end

feature "Admin deletes a product" do
  given(:product) { FactoryGirl.create(:product) }
  given(:admin) { FactoryGirl.create(:admin) }

  background do
    sign_in admin
    visit admin_product_path(product)
  end

  scenario "successfully" do
    click_link "Destroy"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Products"
    expect(page).to_not have_link product.id, href: edit_admin_product_path(product)
    expect(page).to_not have_text product.name
    expect(page).to_not have_text product.description
  end
end