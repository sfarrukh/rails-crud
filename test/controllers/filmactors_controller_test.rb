require 'test_helper'

class FilmactorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get filmactors_index_url
    assert_response :success
  end

  test "should get new" do
    get filmactors_new_url
    assert_response :success
  end

  test "should get delete" do
    get filmactors_delete_url
    assert_response :success
  end

  test "should get edit" do
    get filmactors_edit_url
    assert_response :success
  end

  test "should get show" do
    get filmactors_show_url
    assert_response :success
  end

end
