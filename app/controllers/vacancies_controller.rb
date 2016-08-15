class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:show]

  def index
    @vacancies_grid = initialize_grid(Vacancy)
  end

  def show
  end

  protected

    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end
end
