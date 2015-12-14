require 'rails_helper'

RSpec.describe Journey, type: :model do

  it { is_expected.to have_many :visits }

  context 'when has a visit' do

    let(:journey) { create(:journey, :with_two_visits) }
    let(:first_visit) { journey.visits.first }
    let(:second_visit) { journey.visits.last }

    before do
      allow(journey).to receive(:city_mapper_call) { 10 }
    end

    it 'calculates arrival time of first visit' do
      journey.calculate_arrival_times
      expect(first_visit.arrival_time).to eq("2015-12-13 18:10:00.000000000 +0000")
    end

    it 'caclulates arrival time of second visit' do
      journey.calculate_arrival_times
      expect(second_visit.arrival_time).to eq("2015-12-13 18:20:00.000000000 +0000")
    end

  end
end
