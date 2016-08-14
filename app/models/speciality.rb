class Speciality < ActiveRecord::Base
  has_many :vacancies

  validates :name, presence: true, uniqueness: true
end
