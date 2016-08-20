class Response < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :proposal

  validates :vacancy_id, :proposal_id, presence: true
end
