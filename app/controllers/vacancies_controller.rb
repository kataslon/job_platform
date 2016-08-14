class VacanciesController < ApplicationController

  def index
    @vacancies_grid = initialize_grid(Vacancy)
  end

end
