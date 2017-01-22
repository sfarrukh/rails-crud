require 'test_helper'

class ActorfilmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actorfilms_index_url
    assert_response :success
  end

  test "should get new" do
    get actorfilms_new_url
    assert_response :success
  end

  test "should get delete" do
    get actorfilms_delete_url
    assert_response :success
  end

  test "should get edit" do
    get actorfilms_edit_url
    assert_response :success
  end

  test "should get show" do
    get actorfilms_show_url
    assert_response :success
  end

end
