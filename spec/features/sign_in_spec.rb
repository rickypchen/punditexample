require 'rails_helper'

feature 'Sign in', :devise do

  scenario "User cannot sign in if not registered" do
    sign_in('user@example.com', 'password')
    expect(page).to have_content 'Invalid email or password'
  end

  scenario "User can sign in with correct credentials" do
    user = FactoryGirl.create(:user)
    sign_in(user.email, user.password)
    expect(page).to have_content 'Signed in successfully'
  end

  scenario "User cannot sign in with invalid email" do
    user = FactoryGirl.create(:user)
    sign_in('invalid@email.com', user.password)
    expect(page).to have_content 'Invalid email or password'
  end

  scenario "User cannot sign in with invalid password" do
    user = FactoryGirl.create(:user)
    sign_in(user.email, "blahblahblah")
    expect(page).to have_content 'Invalid email or password'
  end
end