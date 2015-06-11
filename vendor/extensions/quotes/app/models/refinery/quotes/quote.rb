module Refinery
  module Quotes
    class Quote < Refinery::Core::BaseModel
      self.table_name = 'refinery_quotes'

      attr_accessible :name, :quote_text, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
