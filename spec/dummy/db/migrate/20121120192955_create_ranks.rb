class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :user_id
      t.integer :proposal_id
      t.integer :value

      t.timestamps
    end
  end
end
