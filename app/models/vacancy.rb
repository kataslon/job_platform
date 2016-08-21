class Vacancy < ActiveRecord::Base
  resourcify

  belongs_to :company
  belongs_to :speciality
  has_many   :responses, dependent: :destroy
  accepts_nested_attributes_for :responses, allow_destroy: true

  validates :title, :description, :company_id, :speciality_id, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { minimum: 150 }
end
