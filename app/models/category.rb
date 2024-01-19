class Category < ApplicationRecord
  has_many :operations, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
