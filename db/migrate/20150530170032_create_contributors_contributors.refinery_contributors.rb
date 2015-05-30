# This migration comes from refinery_contributors (originally 1)
class CreateContributorsContributors < ActiveRecord::Migration

  def up
    create_table :refinery_contributors do |t|
      t.string :name
      t.text :description
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-contributors"})
    end

    drop_table :refinery_contributors

  end

end
