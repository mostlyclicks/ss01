class ChangeColumnInAthletes < ActiveRecord::Migration
  def up
    change_column :refinery_athletes, :description, :text
  end

  def down
  end
end
