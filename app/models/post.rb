class Post < ActiveRecord::Base

  # uploaders
  mount_uploader :image, ImageUploader

  # callbacks
  before_save { |post| post.permalink = title.parameterize }

  # relationships
  belongs_to :category
  belongs_to :user

  # validations
  validates :title, presence: true, length: { maximum: 150 }, uniqueness: { case_sensitive: false }
  validates :content, presence: true, length: { minimum: 10 }

  def to_param
    permalink
  end

end
