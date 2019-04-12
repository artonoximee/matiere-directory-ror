require 'test_helper'

class StructuresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get structures_index_url
    assert_response :success
  end

  test "should get show" do
    get structures_show_url
    assert_response :success
  end

  test "should get new" do
    get structures_new_url
    assert_response :success
  end

  test "should get create" do
    get structures_create_url
    assert_response :success
  end

  test "should get edit" do
    get structures_edit_url
    assert_response :success
  end

  test "should get update" do
    get structures_update_url
    assert_response :success
  end

  test "should get destroy" do
    get structures_destroy_url
    assert_response :success
  end

end
