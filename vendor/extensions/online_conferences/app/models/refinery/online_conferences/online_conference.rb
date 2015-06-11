module Refinery
  module OnlineConferences
    class OnlineConference < Refinery::Core::BaseModel
      self.table_name = 'refinery_online_conferences'

      attr_accessible :name, :email, :inquiry_from, :topic_one, :topic_two, :topic_three, :position

      # def message was created automatically because you didn't specify a text field
      # when you ran the refinery:form generator. <3 <3 Refinery CMS.
      def message
        "Override def message in vendor/extensions/online_conferences/app/models/refinery/online_conferences/online_conference.rb"
      end

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :name, :presence => true
      validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
      validates :inquiry_from, :presence => true
      validates :topic_one, :presence => true

      INQUIRY_FROM = ["Coach", "Athlete", "Parent"]
    end
  end
end
