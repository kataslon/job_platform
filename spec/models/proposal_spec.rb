require 'spec_helper'

describe Proposal do

  let(:user) { FactoryGirl.create(:user) }
  let(:speciality) { FactoryGirl.create(:speciality) }
  before { @proposal = user.proposals.build(user_id: user.id, speciality_id: speciality.id) }

  subject { @proposal }

  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { expect(@proposal.user).to eq user }
  it { should respond_to(:speciality_id) }
  it { should respond_to(:speciality) }
  it { expect(@proposal.speciality).to eq speciality }
  it { should respond_to(:summary) }
  it { should respond_to(:salary) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @proposal.user_id = nil }
    it { should_not be_valid }
  end

  describe "when speciality_id is not present" do
    before { @proposal.speciality_id = nil }
    it { should_not be_valid }
  end
end

