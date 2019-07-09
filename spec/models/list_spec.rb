require 'rails_helper'

RSpec.describe List, type: :model do
  context 'validations' do
    it { should validate_presence_of(:description) }
  end

  it 'has a valid data' do
    expect(build(:list)).to be_valid
  end

  it 'has an invalid data' do
    expect(build(:bad_list)).to_not be_valid
  end

  describe '.completed_tasks' do
    it 'returns completed tasks' do
      first_list = create(:list, completed: true)
      second_list = create(:list, completed: false)
      third_list = create(:list, completed: true)

      lists = List.completed_tasks

      expect(lists).to include(first_list)
      expect(lists).to include(third_list)
      expect(lists).to_not include(second_list)
    end
  end

   describe '.uncompleted_tasks' do
    it 'returns uncompleted tasks' do
      first_list = create(:list, completed: false)
      second_list = create(:list, completed: false)
      third_list = create(:list, completed: true)

       lists = List.uncompleted_tasks

      expect(lists).to include(first_list)
      expect(lists).to include(second_list)
      expect(lists).to_not include(third_list)
    end
  end
end
