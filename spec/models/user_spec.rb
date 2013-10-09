require 'spec_helper'

describe User do
  
  before { @user = User.new(first_name: "Fulan", last_name: "Ibn Fulan", 
    email: "fulanibnfulan@example.com", password: "secrettt", password_confirmation: "secrettt") }
  subject { @user }

  it { should be_valid }

  # First Name
  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when first name is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end

  # Last Name
  describe "when last name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid }
  end

end
