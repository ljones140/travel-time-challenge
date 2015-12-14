require 'rails_helper'

RSpec.describe Journey, type: :model do

  it { is_expected.to have_many :visits }

  context 'when has a visit' do

    let(:journey) { create(:journey, :with_visit) }
    let(:visit) { journey.visits.first }

    before do
      allow(journey).to receive(:travel_minutes) { 10 }
    end

    it 'calculates arrival time' do
      journey.calculate_arrival_times
      expect(visit.arrival_time).to eq("2015-12-13 18:10:00.000000000 +0000")
    end

  end
end
