require 'rails_helper'

RSpec.describe "CreateChallengesControllers", type: :request do
  current_user = User.first_or_create!(user_id: 'E08', email: 'email@gmail.com', password: '234234',password_confirmation: '234234')
  let(:valid_attributes) do
    {
      'title' => 'Valid title',
      'description' => 'valid description',
      'tags' => 'tag',
      user_id: current_user.id
    }
  end

  let(:invalid_attributes) do
    {
      'title' => '',
      'description' => '',
      'tags' => '',
      user_id: current_user.id
    }
  end

  describe "GET/index" do
    it "renders all successful response" do
      sign_in current_user
      CreateChallenge.create(valid_attributes)
      get new_create_challenge_path
      expect(response).to be_successful
    end
  end

  describe "GET/index" do
    it "renders a successful response" do
      sign_in current_user
      create_challenge = CreateChallenge.create(valid_attributes)
      get new_create_challenge_path(create_challenge)
      expect(response).to be_successful
    end
  end

  describe "POST/create" do
    it "creates a new challenge" do
      sign_in current_user
      expect do
      post create_challenges_path, params: {create_challenge: valid_attributes}
      end.to change(CreateChallenge, :count).by(1)
      expect(response).to have_http_status(:found)
    end
  end

end
