class VacanciesController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_vacancy, only: [:show, :edit, :update]

  def index
    @vacancies_grid = initialize_grid(Vacancy)
  end

  def show
  end

  def new
    @vacancy = Vacancy.new
    # @company = current_user.company if current_user == "manager"
    @company = Company.first
  end

  def create
    @vacancy = Vacancy.create(vacancy_params)
    if @vacancy.save
      flash[:success] = "New vacancy has successfully added"
      redirect_to @vacancy
    else
      render 'new'
    end
  end

  def edit
    # @company = current_user.company if current_user == "manager"
    @company = Company.first
  end

  def update
    if @vacancy.update_attributes(vacancy_params)
      flash[:success] = "Vacancy updated"
      redirect_to @vacancy
    else
      render 'edit'
    end
  end

  def destroy
    Vacancy.find(params[:id]).destroy
    flash[:success] = "Vacancy deleted."
    redirect_to companies_path
  end

  protected

    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def vacancy_params
      params.require(:vacancy).permit(:title, :description, :speciality_id, :company_id)
    end
end
