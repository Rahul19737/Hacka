require 'rails_helper'

RSpec.describe CreateChallenge, type: :model do
  current_user = User.first_or_create!(user_id: 'E08',email: 'guest@guest.com', password: '123456', password_confirmation: '123456')
  it 'belongs to user' do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'has many collaborators' do
    expect(described_class.reflect_on_association(:collaborate).macro).to eq(:has_many)
  end

  it 'has many votes' do
    expect(described_class.reflect_on_association(:vote).macro).to eq(:has_many)
  end

  it "is not valid without a title" do
    create_challenge = CreateChallenge.new(title: nil)
    expect(create_challenge).to_not be_valid
  end

  it "is not valid without a description" do
    create_challenge = CreateChallenge.new(description: nil)
    expect(create_challenge).to_not be_valid
  end

  it "is not valid without tags" do
    create_challenge = CreateChallenge.new(tags: nil)
    expect(create_challenge).to_not be_valid
  end

  it "is valid with valid entries" do
    create_challenge = CreateChallenge.new(
        title: 'Title',
        description: 'Description',
        tags: 'Tag',
        user_id: current_user.id
    )
    expect(create_challenge).to be_valid
  end

end
