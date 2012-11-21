Given /^a regular User exists$/ do
  @user = User.new(:email => Faker::Internet.email)
  @user.password              = '123456'
  @user.password_confirmation = @user.password
  @user.profile = Cfp::Profile.create!
  @user.save

end

Given /^that user is logged in$/ do
  visit root_path
  fill_in 'Email'    , :with => @user.email
  fill_in 'Password' , :with => @user.password

  click_button 'Sign in'
end

Given /^a reviewer User exists$/ do
  step "a regular User exists"
  @user.roles << :reviewer
  @user.save!
end

Given /^a regular User with no profile exists$/ do
  step "a regular User exists"
  @user.profile = nil
  @user.save!
end
