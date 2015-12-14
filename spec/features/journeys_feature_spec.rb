require 'rails_helper'

feature 'journeys' do

    before do
      allow_any_instance_of(Journey).to receive(:city_mapper_call) { 10 }
      Timecop.freeze(2015, 12, 14, 10, 10, 0)
    end

  context 'no journeys created' do

    scenario 'journey is created and dispays arrival times' do
      visit root_path
      expect(page).to have_link 'Start Journey'
      click_link 'Start Journey'
      select '18', from: 'journey_start_time_4i'
      select '00', from: 'journey_start_time_5i'
      click_button 'Submit'
      fill_in 'Post Code', with: 'E18 2AE'
      click_button 'Add Visit'
      fill_in 'Post Code', with: 'EC1V 9HQ'
      click_button 'Add Visit'
      click_link 'Calculate Journey Time'
      expect(page).to have_content 'Start Time: 14/12/2015 18:00'
      expect(page).to have_content 'E18 2AE Arrival Time: 18:10'
      expect(page).to have_content 'EC1V 9HQ Arrival Time: 18:20'
      click_link 'New Journey'
      expect(current_path).to eq root_path
    end

  end

end
