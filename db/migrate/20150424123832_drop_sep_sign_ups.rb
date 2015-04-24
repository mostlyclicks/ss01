class DropSepSignUps < ActiveRecord::Migration
  def up
    drop_table :sep_signups
  end

  def down
  end
end
