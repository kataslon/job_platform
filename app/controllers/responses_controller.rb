class ResponsesController < ApplicationController

  load_and_authorize_resource
  before_action :set_proposal, only: [:edit, :update]

  def edit
  end

  def update
    if @response.update_attributes(response_params)
      flash[:success] = "response updated"
      redirect_to vacancies_path
    else
      render 'edit'
    end
  end

  protected

    def set_proposal
      @response = Response.find(params[:id])
    end

    def response_params
      params.require(:response).permit(:proposal_id, :vacancy_id, :description, :answer)
    end
end
