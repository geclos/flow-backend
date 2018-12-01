class ChangeUniquenessIndexInUser < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, name: :index_users_on_email
    add_index :users, [:company_id, :email], unique: true
  end
end
