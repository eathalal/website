class Category < ActiveRecord::Base

  # callbacks
  before_save { |category| category.permalink = name.parameterize }

  # relationships
  has_many :posts
  has_many :products

  # validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }

  def to_param
    permalink
  end
end