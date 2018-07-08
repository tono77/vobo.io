require 'test_helper'

class SolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sol = sols(:one)
  end

  test "should get index" do
    get sols_url
    assert_response :success
  end

  test "should get new" do
    get new_sol_url
    assert_response :success
  end

  test "should create sol" do
    assert_difference('Sol.count') do
      post sols_url, params: { sol: { desc: @sol.desc, state_id: @sol.state_id, title: @sol.title, user_id: @sol.user_id } }
    end

    assert_redirected_to sol_url(Sol.last)
  end

  test "should show sol" do
    get sol_url(@sol)
    assert_response :success
  end

  test "should get edit" do
    get edit_sol_url(@sol)
    assert_response :success
  end

  test "should update sol" do
    patch sol_url(@sol), params: { sol: { desc: @sol.desc, state_id: @sol.state_id, title: @sol.title, user_id: @sol.user_id } }
    assert_redirected_to sol_url(@sol)
  end

  test "should destroy sol" do
    assert_difference('Sol.count', -1) do
      delete sol_url(@sol)
    end

    assert_redirected_to sols_url
  end
end
