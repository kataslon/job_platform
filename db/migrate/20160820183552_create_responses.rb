class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :vacancy_id
      t.integer :proposal_id
      t.boolean :answer
      t.string :description

      t.timestamps null: false
    end
  end
end
