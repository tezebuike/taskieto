class List < ApplicationRecord

  scope :completed_tasks, -> {
    where(completed: true)
  }

  scope :uncompleted_tasks, -> {
    where(completed: false)
  }
end
