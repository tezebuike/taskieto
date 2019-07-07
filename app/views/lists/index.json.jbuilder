json.array! @lists, partial: "lists/list", as: :list
json.array! @completed_tasks, partial: "lists/list", as: :list
json.array! @uncompleted_tasks, partial: "lists/list", as: :list
