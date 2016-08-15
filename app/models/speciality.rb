class Speciality < ActiveRecord::Base
  resourcify

  has_many :vacancies

  validates :name, presence: true, uniqueness: true
end
