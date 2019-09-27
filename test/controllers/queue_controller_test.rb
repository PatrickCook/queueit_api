require 'test_helper'

class QueueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get queue_index_url
    assert_response :success
  end

  test "should get new" do
    get queue_new_url
    assert_response :success
  end

  test "should get create" do
    get queue_create_url
    assert_response :success
  end

  test "should get show" do
    get queue_show_url
    assert_response :success
  end

  test "should get update" do
    get queue_update_url
    assert_response :success
  end

  test "should get destroy" do
    get queue_destroy_url
    assert_response :success
  end

end
