require 'spec_helper'

describe Company do

  let(:country) { FactoryGirl.create(:country) }

  subject { country }

  it { should respond_to(:country) }
  it { should respond_to(:cities) }

  it { should be_valid }
end
