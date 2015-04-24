class CreateSepInquiries < ActiveRecord::Migration

  def up
    create_table :refinery_sep_inquiries do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :gender
      t.boolean :inquiry_from
      t.string :phone
      t.string :email
      t.string :city
      t.string :state_province
      t.string :country
      t.string :contact_time_1
      t.string :contact_time_2
      t.string :contact_time_3
      t.string :referral_source
      t.text :area_of_focus
      t.text :event_times
      t.text :athletic_background
      t.text :athletic_vision

      t.timestamps
    end

    add_index :refinery_sep_inquiries, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "sep_inquiries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/sep_inquiries"})
    end

    drop_table :refinery_sep_inquiries
  end

end
