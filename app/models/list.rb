class List < ApplicationRecord

  validates :description, presence: true

  scope :completed_tasks, -> { where(completed: true) }
  scope :uncompleted_tasks, -> { where(completed: false) }
end
