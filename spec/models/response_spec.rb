require 'spec_helper'

describe Response do

  let(:proposal) { FactoryGirl.create(:proposal) }
  let(:vacancy) { FactoryGirl.create(:vacancy) }
  before { @response = proposal.responses.build(proposal_id: proposal.id, vacancy_id: vacancy.id) }

  subject { @response }

  it { should respond_to(:proposal_id) }
  it { should respond_to(:proposal) }
  it { expect(@response.proposal).to eq proposal }
  it { should respond_to(:vacancy_id) }
  it { should respond_to(:vacancy) }
  it { expect(@response.vacancy).to eq vacancy }

  it { should be_valid }

  describe "when proposal_id is not present" do
    before { @response.proposal_id = nil }
    it { should_not be_valid }
  end

  describe "when vacancy_id is not present" do
    before { @response.vacancy_id = nil }
    it { should_not be_valid }
  end
end
