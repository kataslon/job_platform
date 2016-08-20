class Proposal < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'

  belongs_to :user
  belongs_to :speciality
  has_many   :responses, dependent: :destroy

  validates :user_id, :speciality_id, presence: true

  mount_uploader :summary, SummaryUploader

end
