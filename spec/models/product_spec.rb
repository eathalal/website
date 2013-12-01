require 'spec_helper'

describe Product do
  
  require 'spec_helper'

describe Product do
  before  do 
    @product = Product.new(
      name: "Beef", description: "Beef is wonderfully delicious.", price: 4.99)
  end
  subject { @product }

  it { should respond_to :category }
  it { should be_valid }

  # to_param
  describe "to_param" do
    before { @product.save }
    specify { @product.to_param.should eq "beef" }
  end

  # Permalink  
  describe "permalink" do
    before { @product.save }
    specify { @product.permalink.should eq "beef" }
  end

  # Name
  describe "when name is not present" do
    before { @product.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @product.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when name is duplicate" do
    before do
      category_with_same_name = @product.dup
      category_with_same_name.save
    end
    it { should_not be_valid } 
  end

  # Description
  describe "when description is not present" do
    before { @product.description = " " }
    it { should_not be_valid }
  end

  describe "when description is too short" do
    before { @product.description = "a" * 9 }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @product.description = "a" * 501 }
    it { should_not be_valid }
  end

  # Price
  describe "when price is not present" do
    before { @product.price = " " }
    it { should_not be_valid }
  end

  describe "when price is not a number" do
    before { @product.price = "somenonnumber" }
    it { should_not be_valid }
  end

  describe "when price is less than 0.01" do
    before { @product.price = "0.00001" }
    it { should_not be_valid }
  end

  describe "when price has too many decimal places" do
    before { @product.price = "0.721" }
    it { should_not be_valid }
  end
end

end
