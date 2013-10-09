require 'spec_helper'

describe Post do
  before  do 
    @post = Post.new(title: "MyTitle", content: "MyyContent")
  end
  subject { @post }

  it { should respond_to :title }
  it { should respond_to :permalink }
  it { should respond_to :content }
  it { should respond_to :category }
  it { should respond_to :image }
  it { should be_valid }

  # to_param
  describe "to_param" do
    before { @post.save }
    specify { @post.to_param.should eq "mytitle" }
  end

  # permalink  
  describe "permalink" do
    before { @post.save }
    specify { @post.permalink.should eq "mytitle" }
  end

  # title
  describe "when title is not present" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @post.title = "a" * 151 }
    it { should_not be_valid }
  end

  describe "when title is duplicate" do
    before do
      post_with_same_title = @post.dup
      post_with_same_title.save
    end
    it { should_not be_valid } 
  end

  # content
  describe "when content is not present" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "when content is too short" do
    before { @post.content = "a" * 9 }
    it { should_not be_valid }
  end

end