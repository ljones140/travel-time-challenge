class AddArrivalTimeToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :arrival_time, :timestamp
  end
end
