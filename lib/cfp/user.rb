module Cfp
  module User
    def self.included(base)
      base.send(:has_many, :proposals, :class_name => "Cfp::Proposal")
      base.send(:extend, ClassMethods)
    end


    module ClassMethods

    end
  end
end
