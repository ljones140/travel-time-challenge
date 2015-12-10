require 'rails_helper'

feature 'journeys' do

  context 'no journeys added' do

    scenario 'displays add journey prompt' do
      visit journeys_path
      expect(page).to have_link 'Start Journey'
      click_link 'Start Journey'
      click_link 'Add Visit'
      fill_in 'Post Code', with: 'E18 2AE'
      click_button 'Calculate Journey Time'
      expect(page). to have_content 'Arrival Time:'
    end

  end

end
