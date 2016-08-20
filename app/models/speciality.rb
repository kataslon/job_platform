class Speciality < ActiveRecord::Base
  resourcify

  has_many :vacancies
  has_many :proposals

  validates :name, presence: true, uniqueness: true
end
