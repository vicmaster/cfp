class CreateCfpComments < ActiveRecord::Migration
  def change
    create_table :cfp_comments do |t|
      t.integer :user_id
  		t.integer :proposal_id
      t.text :body

      t.timestamps
    end
  end
end
