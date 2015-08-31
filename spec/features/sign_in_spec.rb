require 'rails_helper'

feature 'Sign in', :devise do
  # background do
  #   User.make(:email => 'user@example.com', :password => 'caplin')
  # end

  scenario "Cannot sign in if not registered" do
    sign_in('user@example.com', 'password')
    expect(page).to have_content 'Invalid email or password'
  end

  scenario "Signing in with correct credentials" do
    sign_in('user@example.com', 'password')
    expect(page).to have_content 'Success'
  end
end