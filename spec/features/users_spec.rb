require 'spec_helper'

feature "Admin views users" do
  given(:user) { FactoryGirl.create(:user) }

  # background { login admin }

  scenario "index with no categories" do
    visit admin_users_path
    expect(page).to have_title "Eat Halal | Users"
    expect(page).to have_text "No users have been added."
  end

  scenario "index with one user" do
    user
    visit admin_users_path
    expect(page).to have_title "Eat Halal | Users"
    expect(page).to have_text user.id
    expect(page).to have_text user.first_name
    expect(page).to have_text user.last_name
    expect(page).to have_text user.email
  end

  scenario "show" do
    visit admin_user_path(user)
    expect(page).to have_title "Eat Halal | User | #{user.full_name}"
    expect(page).to have_text user.id
    expect(page).to have_text user.first_name
    expect(page).to have_text user.last_name
    expect(page).to have_text user.email
  end
end