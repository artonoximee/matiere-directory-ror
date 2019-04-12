require 'test_helper'

class StructureRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get structure_relations_create_url
    assert_response :success
  end

  test "should get new" do
    get structure_relations_new_url
    assert_response :success
  end

  test "should get edit" do
    get structure_relations_edit_url
    assert_response :success
  end

  test "should get update" do
    get structure_relations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get structure_relations_destroy_url
    assert_response :success
  end

end
