require 'rails_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit '/static_pages/home' }

    describe "should have the content 'Job Platform'" do
      it { should have_content('Job Platform') }
    end

    describe "should have the button 'Show Vacancies'" do
      it { should have_content('Show Vacancies') }
      # expect(page).to have_content('Show Vacancies')
    end

    describe "should have the button 'Show Job Seekers'" do
      it { should have_content('Show Job Seekers') }
      # expect(page).to have_content('Show Job Seekers')
    end
  end
end
