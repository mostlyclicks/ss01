module Refinery
  module Athletes
    module Admin
      class AthletesController < ::Refinery::AdminController

        crudify :'refinery/athletes/athlete',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
