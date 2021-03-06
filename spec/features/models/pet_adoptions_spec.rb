require 'rails_helper'

RSpec.describe PetAdoption, type: :model do
  describe 'relationships' do
    it { should belong_to :pet }
    it { should belong_to :adoption }
  end
end
