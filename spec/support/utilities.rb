include ApplicationHelper

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_danger_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-danger', text: message)
  end
end

RSpec::Matchers.define :have_notice_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-notice', text: message)
  end
end

RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end