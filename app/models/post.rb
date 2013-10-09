class Post < ActiveRecord::Base

  # callbacks
  before_save { |post| post.permalink = title.parameterize }

  # relationships
  belongs_to :category

  # validations
  validates :title, presence: true, length: { maximum: 150 }, uniqueness: { case_sensitive: false }
  validates :content, presence: true, length: { minimum: 10 }

  def to_param
    permalink
  end

end
