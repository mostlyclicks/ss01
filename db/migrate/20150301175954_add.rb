class Add < ActiveRecord::Migration
  def up
    add_column :refinery_athletes, :specialty, :string
  end

  def down
  end
end
