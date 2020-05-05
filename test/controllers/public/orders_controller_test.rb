require 'test_helper'

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_orders_new_url
    assert_response :success
  end

  test "should get confirm" do
    get public_orders_confirm_url
    assert_response :success
  end

  test "should get comp" do
    get public_orders_comp_url
    assert_response :success
  end

end
