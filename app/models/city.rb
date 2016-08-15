class City < ActiveRecord::Base
  resourcify

  belongs_to :country
  has_many :companies

  validates :city, :country_id, presence: true
  validates :city, uniqueness: true
end
