module Refinery
  module TeamMembers
    class TeamMember < Refinery::Core::BaseModel
      self.table_name = 'refinery_team_members'

      attr_accessible :name, :image_id, :title, :description, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
