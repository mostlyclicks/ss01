module Refinery
  module Videos
    class Video < Refinery::Core::BaseModel
      self.table_name = 'refinery_videos'

      attr_accessible :title, :embed_url, :description, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
