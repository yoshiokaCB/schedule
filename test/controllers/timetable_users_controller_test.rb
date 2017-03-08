require 'test_helper'

class TimetableUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetable_user = timetable_users(:one)
  end

  test "should get index" do
    get timetable_users_url
    assert_response :success
  end

  test "should get new" do
    get new_timetable_user_url
    assert_response :success
  end

  test "should create timetable_user" do
    assert_difference('TimetableUser.count') do
      post timetable_users_url, params: { timetable_user: { notice: @timetable_user.notice, program_name: @timetable_user.program_name, timetable_id: @timetable_user.timetable_id, user_id: @timetable_user.user_id } }
    end

    assert_redirected_to timetable_user_url(TimetableUser.last)
  end

  test "should show timetable_user" do
    get timetable_user_url(@timetable_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_timetable_user_url(@timetable_user)
    assert_response :success
  end

  test "should update timetable_user" do
    patch timetable_user_url(@timetable_user), params: { timetable_user: { notice: @timetable_user.notice, program_name: @timetable_user.program_name, timetable_id: @timetable_user.timetable_id, user_id: @timetable_user.user_id } }
    assert_redirected_to timetable_user_url(@timetable_user)
  end

  test "should destroy timetable_user" do
    assert_difference('TimetableUser.count', -1) do
      delete timetable_user_url(@timetable_user)
    end

    assert_redirected_to timetable_users_url
  end
end
