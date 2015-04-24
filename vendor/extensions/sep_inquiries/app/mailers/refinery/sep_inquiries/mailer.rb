module Refinery
  module SepInquiries
    class Mailer < ActionMailer::Base

      def confirmation(sep_inquiry, request)
        @sep_inquiry = sep_inquiry
        mail :subject  => Refinery::SepInquiries::Setting.confirmation_subject,
             :to       => sep_inquiry.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::SepInquiries::Setting.notification_recipients.split(',').first
      end

      def notification(sep_inquiry, request)
        @sep_inquiry = sep_inquiry
        mail :subject  => Refinery::SepInquiries::Setting.notification_subject,
             :to       => Refinery::SepInquiries::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
