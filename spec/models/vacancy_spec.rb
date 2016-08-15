require 'spec_helper'

describe Vacancy do

  let(:company) { FactoryGirl.create(:company) }
  let(:speciality) { FactoryGirl.create(:speciality) }
  before { @vacancy = company.vacancies.build(title:         "Administration of the President",
                                              description:   Faker::Lorem.paragraph(10),
                                              speciality_id: speciality.id,
                                              deadline:      Faker::Date.between(2.days.ago, 20.days.from_now)
                                              )}

  subject { @vacancy }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:deadline) }
  it { should respond_to(:company) }
  it { should respond_to(:company_id) }
  it { should respond_to(:speciality) }
  it { should respond_to(:speciality_id) }
  it { expect(@vacancy.company).to eq company }
  it { expect(@vacancy.speciality).to eq speciality }

  it { should be_valid }

  describe "when company_id is not present" do
    before { @vacancy.company_id = nil }
    it { should_not be_valid }
  end

  describe "when speciality_id is not present" do
    before { @vacancy.speciality_id = nil }
    it { should_not be_valid }
  end
end
