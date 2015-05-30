module Refinery
  module Contributors
    class Contributor < Refinery::Core::BaseModel
      self.table_name = 'refinery_contributors'

      attr_accessible :name, :description, :image_id, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
