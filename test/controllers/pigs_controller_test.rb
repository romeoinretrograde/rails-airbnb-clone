require "test_helper"

class PigsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pigs_index_url
    assert_response :success
  end

  test "should get show" do
    get pigs_show_url
    assert_response :success
  end

  test "should get new" do
    get pigs_new_url
    assert_response :success
  end

  test "should get creaet" do
    get pigs_creaet_url
    assert_response :success
  end

  test "should get edit" do
    get pigs_edit_url
    assert_response :success
  end

  test "should get update" do
    get pigs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pigs_destroy_url
    assert_response :success
  end
end
