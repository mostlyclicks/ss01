module Refinery
  module Contributors
    module Admin
      class ContributorsController < ::Refinery::AdminController

        crudify :'refinery/contributors/contributor',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
