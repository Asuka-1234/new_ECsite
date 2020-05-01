require 'test_helper'

class Adimn::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adimn_items_index_url
    assert_response :success
  end

  test "should get new" do
    get adimn_items_new_url
    assert_response :success
  end

  test "should get show" do
    get adimn_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get adimn_items_edit_url
    assert_response :success
  end

end
