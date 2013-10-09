require 'spec_helper'

describe User do
  
  before { @user = User.new(email: "fulanibnfulan@example.com", password: "secrettt", password_confirmation: "secrettt") }
  subject { @user }

  it { should be_valid }

end
