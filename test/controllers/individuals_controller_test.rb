require 'test_helper'

class IndividualsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get individuals_index_url
    assert_response :success
  end

  test "should get new" do
    get individuals_new_url
    assert_response :success
  end

  test "should get create" do
    get individuals_create_url
    assert_response :success
  end

  test "should get edit" do
    get individuals_edit_url
    assert_response :success
  end

  test "should get update" do
    get individuals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get individuals_destroy_url
    assert_response :success
  end

end
