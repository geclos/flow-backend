class AddHostToSignup < ActiveRecord::Migration[5.0]
  def change
    add_column :signups, :host, :string, null: false
  end
end
