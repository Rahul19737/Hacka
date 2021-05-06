require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many challenges' do
    expect(described_class.reflect_on_association(:create_challenge).macro).to eq(:has_many)
  end

  it 'has many votes' do
    expect(described_class.reflect_on_association(:vote).macro).to eq(:has_many)
  end

  it 'has many collaborators' do
    expect(described_class.reflect_on_association(:collaborate).macro).to eq(:has_many)
  end

#   it "validates user_id" do
#     subject.user_id = 'tend@w'
#     subject.validate 
#     expect(subject.errors[:user_id]).to_not include
#   end

end
