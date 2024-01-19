require 'rails_helper'

RSpec.describe User, type: :model do
  # Association tests
  it 'has many operations' do
    should have_many(:operations).dependent(:destroy)
  end

  it 'has many categories' do
    should have_many(:categories).dependent(:destroy)
  end

  # Devise module tests
  describe 'Devise modules' do
    subject { User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123') }

    it 'is database authenticatable' do
      expect(subject).to be_valid
      subject.save!
      expect(subject.valid_password?('password123')).to be true
    end

    it 'is registerable' do
      expect { subject.save }.to change(User, :count).by(1)
    end

    it 'is rememberable' do
      expect(subject.remember_created_at).to be_nil
      subject.remember_me!
      expect(subject.remember_created_at).not_to be_nil
    end

    it 'is validatable' do
      subject.email = 'invalid_email'
      expect(subject).not_to be_valid
      expect(subject.errors[:email]).to include('is invalid')
    end
  end
end
