require 'spec_helper'

describe Company do

  let(:city) { FactoryGirl.create(:city) }
  before { @company = city.companies.build(name: "Administration of the President") }

  subject { @company }

  it { should respond_to(:name) }
  it { should respond_to(:city_id) }
  it { should respond_to(:city) }
  it { expect(@company.city).to eq city }

  it { should be_valid }

  describe "when city_id is not present" do
    before { @company.city_id = nil }
    it { should_not be_valid }
  end
end
