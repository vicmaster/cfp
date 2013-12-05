class AddApprovedToProposals < ActiveRecord::Migration
  def change
    add_column :cfp_proposals, :approved, :boolean
  end
end
