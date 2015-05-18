module Refinery
  module OnlineConferences
    module Admin
      class OnlineConferencesController < Refinery::AdminController

        crudify :'refinery/online_conferences/online_conference', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_online_conferences
          else
            search_all_online_conferences
          end

          @grouped_online_conferences = group_by_date(@online_conferences)
        end

      end
    end
  end
end
