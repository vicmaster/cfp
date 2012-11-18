module Cfp
  module User
    def self.included?(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods
    end
  end
end
