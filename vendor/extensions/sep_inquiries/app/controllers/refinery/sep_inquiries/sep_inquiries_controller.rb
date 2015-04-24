module Refinery
  module SepInquiries
    class SepInquiriesController < ::ApplicationController
      # layout :false
      before_filter :find_page, :only => [:create, :new]
      # before_filter :page_slug

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/sep_inquiries/thank_you", :include => [:parts])
      end

      def new
        @sep_inquiry = SepInquiry.new
      end

      def create
        @sep_inquiry = SepInquiry.new(params[:sep_inquiry])

        if @sep_inquiry.save
          begin
            Mailer.notification(@sep_inquiry, request).deliver
          rescue => e
            logger.warn "There was an error delivering the sep_inquiry notification.\n#{e.message}\n"
          end

          if SepInquiry.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@sep_inquiry, request).deliver
            rescue => e
              logger.warn "There was an error delivering the sep_inquiry confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to SepInquiry if you wish to send confirmation emails when forms are submitted."
          end
 
          redirect_to refinery.thank_you_sep_inquiries_sep_inquiries_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/sep_inquiries/new', :include => [:parts])
      end

      # def page_slug
      #   R
      # end

    end
  end
end
