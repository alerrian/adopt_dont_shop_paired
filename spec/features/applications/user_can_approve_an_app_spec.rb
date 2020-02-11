require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit application show page' do
    before :each do

    end

    it 'can approve pets for the application on show page' do
      click_on "Approve Application for #{@pet1.name}"

      expect(current_path).to eq("/pets/#{@pet1.id}")

      expect(page).to have_content("Status: Pending adoption for #{adoption1.name}")
    end
  end
end
