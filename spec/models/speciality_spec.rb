require 'spec_helper'

describe Speciality do

  let(:speciality) { FactoryGirl.create(:speciality) }

  subject { speciality }

  it { should respond_to(:name) }
  it { should respond_to(:vacancies) }

  it { should be_valid }
end
