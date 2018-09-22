class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :sector, null: false
      t.string :size, null: false

      t.timestamps null: false
    end
  end
end
