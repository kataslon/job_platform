require 'rails_helper'
include FormHelpers


describe "company owner can set manager to his company" do
  let!(:company_owner) { create(:user, :company_owner) }
  let!(:user) { create(:user) }
  let!(:company) { create(:company, user_id: company_owner.id) }

  before(:each) do
    sign_in(company_owner)
    visit edit_user_path(user)
  end

  it 'should have content Admin' do
    expect(page).to_not have_content('Admin')
  end

  it 'should have content Company owner' do
    expect(page).to_not have_content('Company owner')
  end

  it 'should have content Manager' do
    expect(page).to have_content('Manager')
  end

end
