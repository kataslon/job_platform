class Company < ActiveRecord::Base
  resourcify

  belongs_to :user
  has_many :managers
  belongs_to :city
  has_many :vacancies, dependent: :destroy

  validates :name, :city_id, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true, length: { minimum: 50 }

  def approve
    self.approval = true
    self.user.add_role :company_owner
    self.save
  end

  def reject
    self.approval = false
    self.user.remove_role :company_owner if self.user.companies.count == 1
    self.save
  end
end
