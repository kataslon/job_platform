class Vacancy < ActiveRecord::Base
  belongs_to :company
  belongs_to :speciality

  validates :title, :description, :company_id, :speciality_id, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { minimum: 150 }
end
