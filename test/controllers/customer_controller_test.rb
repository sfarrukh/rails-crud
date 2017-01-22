require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_index_url
    assert_response :success
  end

  test "should get new" do
    get customer_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_edit_url
    assert_response :success
  end

  test "should get delete" do
    get customer_delete_url
    assert_response :success
  end

end
