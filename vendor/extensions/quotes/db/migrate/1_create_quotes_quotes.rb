class CreateQuotesQuotes < ActiveRecord::Migration

  def up
    create_table :refinery_quotes do |t|
      t.string :name
      t.text :quote_text
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-quotes"})
    end

    drop_table :refinery_quotes

  end

end
