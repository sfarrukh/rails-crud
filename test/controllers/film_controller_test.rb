require 'test_helper'

class FilmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get film_index_url
    assert_response :success
  end

  test "should get show" do
    get film_show_url
    assert_response :success
  end

  test "should get new" do
    get film_new_url
    assert_response :success
  end

  test "should get edit" do
    get film_edit_url
    assert_response :success
  end

  test "should get delete" do
    get film_delete_url
    assert_response :success
  end

end
