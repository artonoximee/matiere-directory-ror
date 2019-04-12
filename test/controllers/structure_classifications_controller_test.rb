require 'test_helper'

class StructureClassificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get structure_classifications_new_url
    assert_response :success
  end

  test "should get create" do
    get structure_classifications_create_url
    assert_response :success
  end

  test "should get edit" do
    get structure_classifications_edit_url
    assert_response :success
  end

  test "should get update" do
    get structure_classifications_update_url
    assert_response :success
  end

  test "should get destroy" do
    get structure_classifications_destroy_url
    assert_response :success
  end

end
