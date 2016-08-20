class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :speciality
  has_many   :responses, dependent: :destroy

  validates :user_id, :speciality_id, presence: true
end
