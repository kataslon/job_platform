class Company < ActiveRecord::Base
  belongs_to :city
  belongs_to :country#, through: :cities
  has_many :vacancies

  validates :name, :city_id, presence: true
  validates :name, uniqueness: true
end
