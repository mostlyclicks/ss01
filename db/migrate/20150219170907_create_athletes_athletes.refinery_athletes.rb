# This migration comes from refinery_athletes (originally 1)
class CreateAthletesAthletes < ActiveRecord::Migration

  def up
    create_table :refinery_athletes do |t|
      t.string :name
      t.integer :athlete_image_id
      t.string :nationality
      t.string :club_team
      t.string :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-athletes"})
    end

    drop_table :refinery_athletes

  end

end
