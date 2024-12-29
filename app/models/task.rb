class Task < ApplicationRecord
  belongs_to :todo_list

  validates :title, presence: true
  validates :priority, inclusion: { in: %w[low medium high], message: "%{value} is not a valid priority" }
end
