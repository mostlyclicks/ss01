module Refinery
  module Athletes
    class Athlete < Refinery::Core::BaseModel
      self.table_name = 'refinery_athletes'

      attr_accessible :name, :athlete_image_id, :specialty, :nationality, :club_team, :description, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :athlete_image, :class_name => '::Refinery::Image'
    end
  end
end
