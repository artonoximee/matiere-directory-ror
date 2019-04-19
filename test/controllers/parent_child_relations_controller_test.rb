require 'test_helper'

class ParentChildRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parent_child_relations_index_url
    assert_response :success
  end

  test "should get new" do
    get parent_child_relations_new_url
    assert_response :success
  end

  test "should get create" do
    get parent_child_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get parent_child_relations_destroy_url
    assert_response :success
  end

end
