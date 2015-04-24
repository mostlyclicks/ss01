module Refinery
  module SepInquiries
    class SepInquiry < Refinery::Core::BaseModel
      self.table_name = 'refinery_sep_inquiries'

      attr_accessible :first_name, :last_name, :age, :gender, :inquiry_from, :phone, :email, :city, :state_province, :country, :contact_time_1, :contact_time_2, :contact_time_3, :referral_source, :area_of_focus, :event_times, :athletic_background, :athletic_vision, :position

      alias_attribute :message, :area_of_focus

      alias_attribute :name, :first_name

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :first_name, :presence => true

      GENDERS = ["Male", "Female"]

      REFERRAL_SOURCES = ["Facebook", "Twitter", "Google", "Peer", "Coach", "Other"]
      INQUIRY_FROM = ["Athlete", "Coach", "Parent"]
    end
  end
end
