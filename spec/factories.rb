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
  end
end