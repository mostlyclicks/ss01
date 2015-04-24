class CreateSepSignups < ActiveRecord::Migration
  def change
    create_table :sep_signups do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :contact_type
      t.string :phone
      t.string :email
      t.string :city
      t.string :state_province
      t.string :country
      t.string :contact_time_1
      t.string :contact_time_2
      t.string :contact_time_3
      t.string :referral_source
      t.text :focus
      t.text :events_times
      t.text :athletic_background
      t.text :athlete_vision

      t.timestamps
    end
  end
end
