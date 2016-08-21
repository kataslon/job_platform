class AddDescriptionToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :description, :text
  end
end
