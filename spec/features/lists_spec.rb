require 'rails_helper'

RSpec.feature "List", :type => :feature do

  scenario "Visiting the landing page for the first time" do
    visit root_path
    expect(page).to have_http_status(200)
    expect(page).to have_content("Task list")
    expect(page).to have_content("Hola! You have added no tasks today")
    expect(page).to have_content("Completed tasks")
    expect(page).to have_content("Hola! You have no completed tasks")
    expect(page).to have_button("Add Task")
  end

  scenario "Creating a task with valid description" do
    visit root_path
    fill_in "list[description]", with: "Buy a dog"
    click_button "Add Task"

    expect(page).to have_content("List was successfully created")
    expect(page).to have_content("Buy a dog")
    expect(page.current_path).to eq(root_path)
  end

  scenario "Creating a task with a blank description" do
    visit root_path
    click_button "Add Task"

    expect(page).to have_content("We could not add the task. Description can't be blank")
    expect(page).to have_content("Hola! You have added no tasks today")
    expect(page.current_path).to eq(root_path)
  end

  scenario "Viewing the list of uncompleted tasks" do
    populate_tasks
    within '#uncompleted-tasks' do
      expect(page).to have_content('Walk the dog')
      expect(page).to have_content('Clean the car')
      expect(page).to have_content('Shop for mom')
      expect(first('#list-item')).to have_button('Complete')
    end
    
    within '#completed-tasks' do
      expect(page).to have_content('Hola! You have no completed tasks')
    end
    expect(page.current_path).to eq(root_path)
  end

  scenario "Completing a task" do
    populate_tasks
    
    first('#list-item').click_button('Complete')
    within '#uncompleted-tasks' do
      expect(page).to have_content('Walk the dog')
      expect(page).to have_content('Clean the car')
      expect(page).not_to have_content('Shop for mom')
    end

    within '#completed-tasks' do
      expect(page).to have_content('Shop for mom')
      expect(first('#completed-item')).to have_link('Delete')
    end
    expect(page.current_path).to eq(root_path)
  end
  
  scenario "Deleting a completed task" do
    populate_tasks
    
    first('#list-item').click_button('Complete')
    
    within '#completed-tasks' do
      first('#completed-item').click_link('Delete')
      expect(page).not_to have_content('Shop for mom')
    end
    expect(page).to have_content('List was successfully destroyed.')
    expect(page.current_path).to eq(root_path)
  end
end