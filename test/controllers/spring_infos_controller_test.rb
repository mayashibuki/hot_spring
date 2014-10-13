require 'test_helper'

class SpringInfosControllerTest < ActionController::TestCase
  setup do
    @spring_info = spring_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spring_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spring_info" do
    assert_difference('SpringInfo.count') do
      post :create, spring_info: { area_id: @spring_info.area_id, category_id: @spring_info.category_id, discharge: @spring_info.discharge, metasilicic_acid: @spring_info.metasilicic_acid, name: @spring_info.name, old_quality_name: @spring_info.old_quality_name, osmotic_id: @spring_info.osmotic_id, pH: @spring_info.pH, place: @spring_info.place, quality_name: @spring_info.quality_name, remarks: @spring_info.remarks, temperature: @spring_info.temperature, transportation: @spring_info.transportation }
    end

    assert_redirected_to spring_info_path(assigns(:spring_info))
  end

  test "should show spring_info" do
    get :show, id: @spring_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spring_info
    assert_response :success
  end

  test "should update spring_info" do
    patch :update, id: @spring_info, spring_info: { area_id: @spring_info.area_id, category_id: @spring_info.category_id, discharge: @spring_info.discharge, metasilicic_acid: @spring_info.metasilicic_acid, name: @spring_info.name, old_quality_name: @spring_info.old_quality_name, osmotic_id: @spring_info.osmotic_id, pH: @spring_info.pH, place: @spring_info.place, quality_name: @spring_info.quality_name, remarks: @spring_info.remarks, temperature: @spring_info.temperature, transportation: @spring_info.transportation }
    assert_redirected_to spring_info_path(assigns(:spring_info))
  end

  test "should destroy spring_info" do
    assert_difference('SpringInfo.count', -1) do
      delete :destroy, id: @spring_info
    end

    assert_redirected_to spring_infos_path
  end
end
