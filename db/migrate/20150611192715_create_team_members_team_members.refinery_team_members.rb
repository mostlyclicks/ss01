# This migration comes from refinery_team_members (originally 1)
class CreateTeamMembersTeamMembers < ActiveRecord::Migration

  def up
    create_table :refinery_team_members do |t|
      t.string :name
      t.integer :image_id
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-team_members"})
    end

    drop_table :refinery_team_members

  end

end
