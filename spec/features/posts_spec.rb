require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "adding a new post" do
  given(:category) { FactoryGirl.create(:category) }
  given(:user)     { FactoryGirl.create(:user) }
 
  background do
    category 
    sign_in user # should be an admin rather than normal user.
    visit new_admin_post_path
  end

  scenario "with valid information" do
    select category.name, from: "Category"
    fill_in "Title",   with: "MyPostTitle"
    fill_in "Content", with: "MyPostContent"
    click_button "Create Post"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Post | MyPostTitle"
    expect(page).to have_text "MyPostContent"
  end

  scenario "with invalid information" do
    click_button "Create Post"
    expect(page).to have_danger_message
    expect(page).to have_title "Eat Halal | Post | New"
  end
end

feature "Admin edits a post" do
  given(:post) { FactoryGirl.create(:post) }
  background do
    # login admin
    visit edit_admin_post_path(post)
  end

  scenario "with valid information" do
    fill_in "Title",   with: "MyNewPostTitle"
    fill_in "Content", with: "MyNewPostContent"
    click_button "Update Post"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Post | MyNewPostTitle"
    expect(page).to have_text "MyNewPostContent"
  end

  scenario "with invalid information" do
    fill_in "Content", with: "  "
    click_button "Update Post"
    expect(page).to have_danger_message
    expect(page).to have_title "Eat Halal | Post | Edit #{post.title}"
  end
end

feature "Admin views post index" do
  given(:post) { FactoryGirl.create(:post) }

  # background { login admin }

  scenario "with no posts" do
    visit admin_posts_path
    expect(page).to have_title "Eat Halal | Posts"
    expect(page).to have_text "No posts have been added."
  end

  scenario "with one post" do
    post
    visit admin_posts_path
    expect(page).to have_title "Eat Halal | Posts"
    expect(page).to have_text post.id
    expect(page).to have_text post.title
    expect(page).to have_text post.content
  end
end

feature "Admin deletes a post" do
  given!(:post) { FactoryGirl.create(:post) }
  background do
    # login admin
    visit admin_post_path(post)
  end

  scenario "successfully" do
    click_link "Destroy"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Posts"
    expect(page).to_not have_link post.id, href: admin_post_path(post)
    expect(page).to_not have_text post.title
    expect(page).to_not have_text post.content
  end
end