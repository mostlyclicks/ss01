module Refinery
  module SepInquiries
    module Admin
      class SepInquiriesController < Refinery::AdminController

        crudify :'refinery/sep_inquiries/sep_inquiry', 
                :title_attribute => "first_name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_sep_inquiries
          else
            search_all_sep_inquiries
          end

          @grouped_sep_inquiries = group_by_date(@sep_inquiries)
        end

      end
    end
  end
end
