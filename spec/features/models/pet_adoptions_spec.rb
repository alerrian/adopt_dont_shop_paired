require 'rails_helper'

RSpec.describe PetAdoption, type: :model do
  describe 'relationships' do
    it { should belong_to :pets }
    it { should belong_to :adoptions }
  end
end
