class AddPollTokenToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :poll_token, :string, null: false
  end
end
