require 'test_helper'

class TimetablePropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetable_property = timetable_properties(:one)
  end

  test "should get index" do
    get timetable_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_timetable_property_url
    assert_response :success
  end

  test "should create timetable_property" do
    assert_difference('TimetableProperty.count') do
      post timetable_properties_url, params: { timetable_property: { timetable_id: @timetable_property.timetable_id, upper_limit: @timetable_property.upper_limit } }
    end

    assert_redirected_to timetable_property_url(TimetableProperty.last)
  end

  test "should show timetable_property" do
    get timetable_property_url(@timetable_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_timetable_property_url(@timetable_property)
    assert_response :success
  end

  test "should update timetable_property" do
    patch timetable_property_url(@timetable_property), params: { timetable_property: { timetable_id: @timetable_property.timetable_id, upper_limit: @timetable_property.upper_limit } }
    assert_redirected_to timetable_property_url(@timetable_property)
  end

  test "should destroy timetable_property" do
    assert_difference('TimetableProperty.count', -1) do
      delete timetable_property_url(@timetable_property)
    end

    assert_redirected_to timetable_properties_url
  end
end
