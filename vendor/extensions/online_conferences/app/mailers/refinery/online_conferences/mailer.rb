module Refinery
  module OnlineConferences
    class Mailer < ActionMailer::Base

      def confirmation(online_conference, request)
        @online_conference = online_conference
        mail :subject  => Refinery::OnlineConferences::Setting.confirmation_subject,
             :to       => online_conference.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::OnlineConferences::Setting.notification_recipients.split(',').first
      end

      def notification(online_conference, request)
        @online_conference = online_conference
        mail :subject  => Refinery::OnlineConferences::Setting.notification_subject,
             :to       => Refinery::OnlineConferences::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
