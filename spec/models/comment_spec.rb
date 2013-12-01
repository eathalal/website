require 'spec_helper'

describe Comment do

  subject { @comment }

  before do
    @comment = Comment.new(content: "My comment is the best!")
  end

  it { should be_valid }

  # content
  describe "when content is not present" do
    before { @comment.content = " " }
    it { should_not be_valid }
  end

  describe "when content is too short" do
    before { @comment.content = "a" * 9 }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @comment.content = "a" * 10001 }
    it { should_not be_valid }
  end

end