class Rank < ActiveRecord::Base
  attr_accessible :int_value, :proposal_id, :user_id

  belongs_to :user
end
