require 'test_helper'

class EnvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @env = envs(:one)
  end

  test "should get index" do
    get envs_url
    assert_response :success
  end

  test "should get new" do
    get new_env_url
    assert_response :success
  end

  test "should create env" do
    assert_difference('Env.count') do
      post envs_url, params: { env: { name: @env.name } }
    end

    assert_redirected_to env_url(Env.last)
  end

  test "should show env" do
    get env_url(@env)
    assert_response :success
  end

  test "should get edit" do
    get edit_env_url(@env)
    assert_response :success
  end

  test "should update env" do
    patch env_url(@env), params: { env: { name: @env.name } }
    assert_redirected_to env_url(@env)
  end

  test "should destroy env" do
    assert_difference('Env.count', -1) do
      delete env_url(@env)
    end

    assert_redirected_to envs_url
  end
end
