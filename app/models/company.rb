class Company < ActiveRecord::Base
  belongs_to :city
  has_many :vacancies

  validates :name, :city_id, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true, length: { minimum: 50 }
end
