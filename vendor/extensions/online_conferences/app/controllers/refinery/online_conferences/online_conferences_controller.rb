module Refinery
  module OnlineConferences
    class OnlineConferencesController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/online_conferences/thank_you", :include => [:parts])
      end

      def new
        @online_conference = OnlineConference.new
      end

      def create
        @online_conference = OnlineConference.new(params[:online_conference])

        if @online_conference.save
          begin
            Mailer.notification(@online_conference, request).deliver
          rescue => e
            logger.warn "There was an error delivering the online_conference notification.\n#{e.message}\n"
          end

          if OnlineConference.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@online_conference, request).deliver
            rescue => e
              logger.warn "There was an error delivering the online_conference confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to OnlineConference if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_online_conferences_online_conferences_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/online_conferences/new', :include => [:parts])
      end

    end
  end
end
