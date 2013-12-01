require 'spec_helper'

describe Category do
  before  do 
    @category = Category.new(name: "MyName", description: "MyDescription")
  end
  subject { @category }

  it { should respond_to :name }
  it { should respond_to :permalink }
  it { should respond_to :description }
  it { should respond_to :products }
  it { should be_valid }

  # to_param
  describe "to_param" do
    before { @category.save }
    specify { @category.to_param.should eq "myname" }
  end

  # permalink  
  describe "permalink" do
    before { @category.save }
    specify { @category.permalink.should eq "myname" }
  end

  # name
  describe "when name is not present" do
    before { @category.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @category.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when name is duplicate" do
    before do
      category_with_same_name = @category.dup
      category_with_same_name.save
    end
    it { should_not be_valid } 
  end

  # Description
  describe "when description is not present" do
    before { @category.description = " " }
    it { should_not be_valid }
  end

  describe "when description is too short" do
    before { @category.description = "a" * 9 }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @category.description = "a" * 501 }
    it { should_not be_valid }
  end
end