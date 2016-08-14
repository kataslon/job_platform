class Country < ActiveRecord::Base
  has_many :cities

  validates :country, presence: true, uniqueness: true
end
