require 'test_helper'

class WaitStatusesControllerTest < ActionController::TestCase
  setup do
    @wait_status = wait_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wait_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wait_status" do
    assert_difference('WaitStatus.count') do
      post :create, wait_status: { employee_id: @wait_status.employee_id, member_id: @wait_status.member_id, start_date: @wait_status.start_date, table_type: @wait_status.table_type }
    end

    assert_redirected_to wait_status_path(assigns(:wait_status))
  end

  test "should show wait_status" do
    get :show, id: @wait_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wait_status
    assert_response :success
  end

  test "should update wait_status" do
    patch :update, id: @wait_status, wait_status: { employee_id: @wait_status.employee_id, member_id: @wait_status.member_id, start_date: @wait_status.start_date, table_type: @wait_status.table_type }
    assert_redirected_to wait_status_path(assigns(:wait_status))
  end

  test "should destroy wait_status" do
    assert_difference('WaitStatus.count', -1) do
      delete :destroy, id: @wait_status
    end

    assert_redirected_to wait_statuses_path
  end
end
