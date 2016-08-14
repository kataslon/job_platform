require 'spec_helper'

describe City do

  let(:country) { FactoryGirl.create(:country) }
  before { @city = country.cities.build(city: "Kiev") }

  subject { @city }

  it { should respond_to(:city) }
  it { should respond_to(:country_id) }
  it { should respond_to(:country) }
  it { expect(@city.country).to eq country }

  it { should be_valid }

  describe "when country_id is not present" do
    before { @city.country_id = nil }
    it { should_not be_valid }
  end
end
