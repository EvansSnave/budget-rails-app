require 'rails_helper'

RSpec.describe Category, type: :model do
  # Assuming Category has attributes like :name and :description

  # Validation tests
  it 'is valid with valid attributes' do
    category = build(:category)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = build(:category, name: nil)
    expect(category).not_to be_valid
    expect(category.errors.messages[:name]).to include("can't be blank")
  end
end
