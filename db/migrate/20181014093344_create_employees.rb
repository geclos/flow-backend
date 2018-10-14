class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :user, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.timestamp :form_sent_at
    end
  end
end
