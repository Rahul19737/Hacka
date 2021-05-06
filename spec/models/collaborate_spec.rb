require 'rails_helper'

RSpec.describe Collaborate, type: :model do
  it 'belongs to challenge' do
    expect(described_class.reflect_on_association(:create_challenge).macro).to eq(:belongs_to)
  end

  it 'belongs to user' do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
end
