class CreateCampaignMember < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_members do |t|
      t.references :employee, null: false, index: true, foreign_key: true
      t.references :campaign, null: false, index: true, foreign_key: true
      t.string :poll_token, null: false
    end
  end
end
