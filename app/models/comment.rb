class Comment < ActiveRecord::Base

  # relationships
  belongs_to :commentable, polymorphic: true
  
  # validations
  validates :content, presence: true, length: { minimum: 10, maximum: 10000 }
end
