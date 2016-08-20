class ProposalsController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_proposal, only: [:show, :edit, :update]

  def index
      @proposals_grid = initialize_grid(Proposal)
  end

  def applicant_index
      @proposals_grid = initialize_grid(Proposal.where(user_id: current_user.id))
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.create(proposal_params)
    if @proposal.save
      flash[:success] = "New proposal has successfully added"
      redirect_to proposals_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @proposal.update_attributes(proposal_params)
      flash[:success] = "Proposal updated"
      redirect_to proposals_path
    else
      render 'edit'
    end
  end

  def destroy
    proposal.find(params[:id]).destroy
    flash[:success] = "proposal deleted."
    redirect_to proposals_path
  end

  protected

    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    def proposal_params
      params.require(:proposal).permit(:user_id, :speciality_id, :summary, :salary)
    end
end
