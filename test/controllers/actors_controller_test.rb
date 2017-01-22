require 'test_helper'

class ActorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actors_index_url
    assert_response :success
  end

  test "should get index" do
    get actors_index_url
    assert_response :success
  end

  test "should get show" do
    get actors_show_url
    assert_response :success
  end

  test "should get new" do
    get actors_new_url
    assert_response :success
  end

  test "should get edit" do
    get actors_edit_url
    assert_response :success
  end

  test "should get delete" do
    get actors_delete_url
    assert_response :success
  end

end
