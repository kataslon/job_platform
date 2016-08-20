class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :user_id
      t.integer :speciality_id
      t.string :summary
      t.integer :salary

      t.timestamps null: false
    end
  end
end
