class Manager < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  validates :user_id, :company_id, presence: true
end
