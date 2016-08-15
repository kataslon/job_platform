class Country < ActiveRecord::Base
  resourcify

  has_many :cities

  validates :country, presence: true, uniqueness: true
end
