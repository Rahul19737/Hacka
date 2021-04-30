require 'test_helper'

class CreateChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_challenge = create_challenges(:one)
  end

  test "should get index" do
    get create_challenges_url
    assert_response :success
  end

  test "should get new" do
    get new_create_challenge_url
    assert_response :success
  end

  test "should create create_challenge" do
    assert_difference('CreateChallenge.count') do
      post create_challenges_url, params: { create_challenge: { description: @create_challenge.description, tags: @create_challenge.tags, title: @create_challenge.title } }
    end

    assert_redirected_to create_challenge_url(CreateChallenge.last)
  end

  test "should show create_challenge" do
    get create_challenge_url(@create_challenge)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_challenge_url(@create_challenge)
    assert_response :success
  end

  test "should update create_challenge" do
    patch create_challenge_url(@create_challenge), params: { create_challenge: { description: @create_challenge.description, tags: @create_challenge.tags, title: @create_challenge.title } }
    assert_redirected_to create_challenge_url(@create_challenge)
  end

  test "should destroy create_challenge" do
    assert_difference('CreateChallenge.count', -1) do
      delete create_challenge_url(@create_challenge)
    end

    assert_redirected_to create_challenges_url
  end
end
