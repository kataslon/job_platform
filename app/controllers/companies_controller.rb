class CompaniesController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update]

  def show
  end

  def index
    @companies_grid = initialize_grid(Company)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      flash[:success] = "New company has successfully added"
      redirect_to @company
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @company.update_attributes(company_params)
      flash[:success] = "Company updated"
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    Company.find(params[:id]).destroy
    flash[:success] = "Company deleted."
    redirect_to companies_path
  end

  protected

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :description, :city_id)
    end
end
