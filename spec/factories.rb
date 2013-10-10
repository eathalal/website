FactoryGirl.define do
  
  factory :category do
    name "MyCategoryName"
    description "MyCategoryDescription"
  end

  factory :product do
    name "MyProductName"
    description "MyProductDescription"
  end

  factory :post do
    title "MyPostTitle"
    content "MyPostContent"
    category
    user
  end

  factory :user do
    first_name "FirstName"
    last_name "LastName"
    email "email@address.com"
    password "password"
    password_confirmation "password"
    confirmed_at Time.zone.now
  end
end