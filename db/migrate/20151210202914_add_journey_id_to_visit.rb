class AddJourneyIdToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :journey, index: true, foreign_key: true
  end
end
