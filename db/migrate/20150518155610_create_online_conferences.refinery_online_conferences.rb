# This migration comes from refinery_online_conferences (originally 1)
class CreateOnlineConferences < ActiveRecord::Migration

  def up
    create_table :refinery_online_conferences do |t|
      t.string :name
      t.string :email
      t.string :inquiry_from
      t.string :topic_one
      t.string :topic_two
      t.string :topic_three

      t.timestamps
    end

    add_index :refinery_online_conferences, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "online_conferences"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/online_conferences"})
    end

    drop_table :refinery_online_conferences
  end

end
