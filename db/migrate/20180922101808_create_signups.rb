class CreateSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :signups do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :confirmation_token, null: false
      t.references :user, index: true, foreign_key: { on_delete: :nullify }

      t.timestamps null: false
    end

    add_index :signups, :email, unique: true
    add_index :signups, :confirmation_token, unique: true
  end
end
