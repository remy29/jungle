require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!(name: "Roberto", email:"don_robert@msn.com", password: "123456", password_confirmation: "123456") 
  end
  
  scenario "The user can navigate to the login page and sign in" do
    # ACT
    visit login_path

    fill_in 'email', with: @user.email
    fill_in 'password', with: '123456'

    click_button('Submit')

    expect(page).to have_content ("Signed in as Roberto")

    # VERIFY
    
    # DEBUG
    save_screenshot
  end
end
