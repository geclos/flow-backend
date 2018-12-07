class ChangeNullOptionEmployeePollToken < ActiveRecord::Migration[5.0]
  def change
    change_column_null :employees, :poll_token, true
  end
end
