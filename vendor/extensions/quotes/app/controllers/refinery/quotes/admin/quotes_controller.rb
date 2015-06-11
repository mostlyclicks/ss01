module Refinery
  module Quotes
    module Admin
      class QuotesController < ::Refinery::AdminController

        crudify :'refinery/quotes/quote',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
