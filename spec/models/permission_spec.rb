require "spec_helper"

describe Permission do

  describe "as guest" do
    subject { Permission.new(nil) }

    # posts
    it { should allow(:posts, :index) }
    it { should allow(:posts, :show) }

    # devise/sessions
    it { should allow('devise/sessions', :new) }
    it { should allow('devise/sessions', :create) }
    it { should_not allow('devise/sessions', :destroy) }

    # devise/registrations
    it { should allow('devise/registrations', :new) }
    it { should allow('devise/registrations', :create) }

    # devise/confirmations
    it { should allow('devise/confirmations', :new) }
    it { should allow('devise/confirmations', :show) }

    # devise/passwords
    it { should allow('devise/passwords', :new) }
    it { should allow('devise/passwords', :create) }
    it { should allow('devise/passwords', :edit) }
    it { should allow('devise/passwords', :update) }

    # categories
    # it { should allowed(:categories, :index) }
    # it { should allowed(:categories, :show) }

    # users
    # it { should allowed(:users, :new) }
    # it { should allowed(:users, :create) }
    # it { should_not allowed(:users, :show) }
    # it { should_not allowed(:users, :edit) }
    # it { should_not allowed(:users, :update) }
    # it { should_not allowed(:users, :destroy) }

    # # contacts
    # it { should allowed(:contacts, :new) }
    # it { should allowed(:contacts, :create) }

    # # supports
    # it { should_not allowed(:supports, :index) }

  end

  describe "as user" do
    let(:current_user) { FactoryGirl.create(:user) }
  #   let(:other_user) { FactoryGirl.create(:user) }
    subject { Permission.new(current_user) }

  #   # categories
  #   it { should allowed(:categories, :index) }
  #   it { should allowed(:categories, :show) }

    # users
    it { should_not allow('devise/registrations', :new) }
    it { should_not allow('devise/registrations', :create) }
  #   it { should_not allowed(:users, :show, other_user) }
  #   it { should_not allowed(:users, :edit, other_user) }
  #   it { should_not allowed(:users, :update, other_user) }
  #   it { should_not allowed(:users, :show) }
  #   it { should_not allowed(:users, :edit) }
  #   it { should_not allowed(:users, :update) }
  #   it { should allowed(:users, :show, current_user) }
  #   it { should allowed(:users, :edit, current_user) }
  #   it { should allowed(:users, :update, current_user) }
    
    # sessions
    it { should_not allow('devise/sessions', :new) }
    it { should_not allow('devise/sessions', :create) }
    it { should allow('devise/sessions', :destroy) }

  #   # supports
  #   it { should allowed(:supports, :index) }
  end

  # describe "as a user without a verified email address" do
  #   let(:user) { FactoryGirl.create(:user) }
  #   subject { Permission.new(user) }
    
  #   # email validates
  #   it { should allowed(:email_validates, :create) }
  #   it { should allowed(:email_validates, :update) }
  #   it { should allowed(:email_validates, :edit) }
  # end

  # describe "as a user with a verified email address" do
  #   let(:user) { FactoryGirl.create(:active) }
  #   subject { Permission.new(user) }
    
  #   # email validates
  #   it { should_not allowed(:email_validates, :create) }
  #   it { should_not allowed(:email_validates, :update) }
  #   it { should_not allowed(:email_validates, :edit) }
  # end

  describe "as admin" do
    subject { Permission.new(FactoryGirl.build(:admin)) }
    it { should allow(:anything, :here) }
  end
end