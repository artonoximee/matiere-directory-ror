require 'test_helper'

class ReferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get references_index_url
    assert_response :success
  end

  test "should get show" do
    get references_show_url
    assert_response :success
  end

  test "should get create" do
    get references_create_url
    assert_response :success
  end

  test "should get new" do
    get references_new_url
    assert_response :success
  end

  test "should get edit" do
    get references_edit_url
    assert_response :success
  end

  test "should get update" do
    get references_update_url
    assert_response :success
  end

  test "should get destroy" do
    get references_destroy_url
    assert_response :success
  end

end
