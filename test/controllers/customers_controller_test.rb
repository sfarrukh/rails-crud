require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_index_url
    assert_response :success
  end

  test "should get create" do
    get customers_create_url
    assert_response :success
  end

  test "should get new" do
    get customers_new_url
    assert_response :success
  end

  test "should get create" do
    get customers_create_url
    assert_response :success
  end

  test "should get edit" do
    get customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get customers_update_url
    assert_response :success
  end

  test "should get delete" do
    get customers_delete_url
    assert_response :success
  end

end
