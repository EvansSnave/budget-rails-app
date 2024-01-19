class Operation < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true
end
