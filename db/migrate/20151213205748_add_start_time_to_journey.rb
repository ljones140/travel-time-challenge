class AddStartTimeToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :start_time, :datetime
  end
end
