class CompaniesController < ApplicationController
  before_action :set_company, only: [:show]

  def show
  end

  def index
    @companies_grid = initialize_grid(Company)
  end

  protected

    def set_company
      @company = Company.find(params[:id])
    end
end
