module Features
  module ListsHelper
    def populate_tasks
      visit root_path
      
      ["Walk the dog", "Clean the car", "Shop for mom"].each do |task|
        fill_in "list[description]", with: task
        click_button "Add Task"
      end
    end
  end
end

RSpec.configure do |config|
  config.include Features::ListsHelper, type: :feature
end