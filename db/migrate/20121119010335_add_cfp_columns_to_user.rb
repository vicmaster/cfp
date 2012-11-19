class AddCfpColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :roles
    end
  end
end
