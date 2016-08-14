require 'spec_helper'

describe VacanciesController do

  describe 'GET #index' do
    let(:vacansies) { create_list(:vacancy, 2) }
    before { get :index }

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'pupulates an array of all purchases' do
      expect(assigns(:vacansies)).to match_array(vacansies)
    end
  end

end
