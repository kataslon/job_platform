class AddUserIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :user_id, :integer
    add_column :companies, :approval, :boolean, default: false
  end
end
