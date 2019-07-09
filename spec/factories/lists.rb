FactoryBot.define do
  factory :list do
    description { "Get certified" }
    completed { false }
    
    factory :bad_list do
      description { "" }
      completed { false }
    end
  end
end
