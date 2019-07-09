require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'validations' do
    subject { build(:list) }

    it { should validate_presence_of(:description) }
  end

  describe 'invalidations' do
    subject { build(:bad_list) }

    it { should validate_presence_of(:description) }
  end
end
