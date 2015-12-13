require 'rails_helper'

RSpec.describe Journey, type: :model do

  it { is_expected.to have_many :visits }

  context 'when has a visit' do

    let(:journey) { create(:journey, :with_visit) }

    before do
      allow(journey).to receive(:city_mapper_call) { 37 }
    end

    it 'calculates arrival time' do
      expect(journey.arrival_time).to eq(37)
    end

  end
end
