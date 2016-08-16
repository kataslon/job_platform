class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :admin, :company_owner, :manager, :applicant

  def set_role(params)
    params.each do |role, value|
      value.to_i == 1 ? self.add_role(eval(":#{role}")) : self.remove_role(eval(":#{role}"))
    end
  end

  private

    def assign_default_role
      self.add_role :user
    end
end
