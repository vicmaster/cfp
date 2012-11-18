class CreateCfpProposals < ActiveRecord::Migration
  def change
    create_table :cfp_proposals do |t|
      t.integer :user_id
      t.string  :title
      t.string  :level
      t.text    :abstract
      t.string  :tags


      t.timestamps
    end
  end
end
