require 'rails_helper'

describe 'angular', js: true do
  let(:normal_user) { create_normal_user }
  let(:super_admin) { create_super_admin }

  before do
    sign_in normal_user
  end

  it 'works!' do
    expect(page).to have_content 'Greeting!'
  end

  it 'open first page' do
    expect(page).to have_content "Hello! #{normal_user.email}"
  end

  it 'can go to second page' do
    click_link 'Second'
    expect(page).to have_content 'Seccond page'
  end

  it 'can reset password' do
    ss('m')
    visit 'users/password/new'

    fill_in 'Email', with: super_admin.email
    expect(super_admin.reset_password_token).to be_nil
    click_botton('Send me reset password instructions')
    sleep 1

    expect(super_admin.reset_password_token).to_not be_nil
  end

end
