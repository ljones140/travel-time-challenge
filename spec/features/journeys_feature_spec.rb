require 'rails_helper'

feature 'journeys' do

  context 'no journeys added' do

    scenario 'displays add journey prompt' do
      visit journeys_path
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
      expect(page). to have_content 'E18 2AE Arrival Time:'
      expect(page). to have_content 'EC1V 9HQ Arrival Time:'
    end

  end

end
