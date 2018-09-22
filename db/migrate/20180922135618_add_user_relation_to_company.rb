class AddUserRelationToCompany < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :company, index: true, foreign_key: { on_delete: :cascade }
  end
end
