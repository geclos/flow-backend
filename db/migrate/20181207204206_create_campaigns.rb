class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.date :date
      t.integer :revenue_in_cents
      t.integer :growth_percentage_in_cents
      t.integer :number_of_patents
      t.references :company, null: false, index: true, foreign_key: { on_delete: :cascade }
    end
  end
end
