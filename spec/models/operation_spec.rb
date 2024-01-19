require 'rails_helper'

RSpec.describe Operation, type: :model do
  it 'is not valid without an amount' do
    operation = build(:operation, amount: nil)
    expect(operation).not_to be_valid
    expect(operation.errors.messages[:amount]).to include("can't be blank")
  end

  # Association tests
  it 'belongs to a user' do
    should belong_to(:user)
  end

  it 'belongs to a category' do
    should belong_to(:category)
  end

  # Assuming that when you delete a User, it should destroy all related Operations
  describe 'associations' do
    it 'is destroyed when the user is destroyed' do
      user = create(:user)
      create(:operation, user:)
      expect { user.destroy }.to change(Operation, :count).by(-1)
    end

    # And similarly for category:
    it 'is destroyed when the category is destroyed' do
      category = create(:category)
      create(:operation, category:)
      expect { category.destroy }.to change(Operation, :count).by(-1)
    end
  end
end
