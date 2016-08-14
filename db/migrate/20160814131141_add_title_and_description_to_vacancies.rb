class AddTitleAndDescriptionToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :title, :string
    add_column :vacancies, :description, :text
  end
end
