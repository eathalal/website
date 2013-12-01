class Product < ActiveRecord::Base

  # callbacks
  before_save { |product| product.permalink = name.parameterize }

  # relationships
  belongs_to :category

  # validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :price, format: { with: /\A\d+??(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 0.01 }

  def to_param
    permalink
  end
end