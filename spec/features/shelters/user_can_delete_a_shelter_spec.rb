require 'rails_helper'

RSpec.describe "shelters/:id show page", type: :feature do
  context "as a visitor" do
    it "when I visit a shelter show page to delete the shelter" do
      shelter1 = Shelter.create(name: "Denver Dog Shelter",
                                address: "1530 S. High St.",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")

      visit "/shelters/#{shelter1.id}"
      expect(page).to have_content(shelter1.name)

      click_on "Delete Shelter"
      expect(current_path).to eq("/shelters")
      expect(page).to have_no_content(shelter1.name)
    end
  end
end
