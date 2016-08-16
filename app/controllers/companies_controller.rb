class CompaniesController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:show, :edit, :update]
  before_action :set_grid, only: [:index, :approve_company, :reject_company]

  def show
  end

  def index
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

  def approve_company
    @company = Company.find(params[:id])
    @company.approve
    respond_to do |format|
      format.html { redirect_to companies_path }
      format.js
    end
  end

  def reject_company
    @company = Company.find(params[:id])
    @company.reject
    respond_to do |format|
      format.html { redirect_to companies_path }
      format.js
    end
  end

  protected

    def set_company
      @company = Company.find(params[:id])
    end

    def set_grid
      if current_user && current_user.has_role?(:admin)
        @companies_grid = initialize_grid(Company)
      else
        @companies_grid = initialize_grid(Company.where(approval: true))
      end
    end

    def company_params
      params.require(:company).permit(:name, :description, :city_id)
    end
end
