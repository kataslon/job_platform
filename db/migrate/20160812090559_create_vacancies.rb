class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.integer :company_id
      t.date :deadline
      t.integer :speciality_id
      t.boolean :relevance, default: true

      t.timestamps null: false
    end
  end
end
