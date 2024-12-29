class TodoList < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :priority, inclusion: { in: %w[low medium high], message: "%{value} is not a valid priority" }
end
