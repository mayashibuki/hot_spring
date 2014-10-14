require 'test_helper'

class SpringPlacesControllerTest < ActionController::TestCase
  setup do
    @spring_place = spring_places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spring_places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spring_place" do
    assert_difference('SpringPlace.count') do
      post :create, spring_place: { area_id: @spring_place.area_id, name: @spring_place.name, place: @spring_place.place, transportation: @spring_place.transportation }
    end

    assert_redirected_to spring_place_path(assigns(:spring_place))
  end

  test "should show spring_place" do
    get :show, id: @spring_place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spring_place
    assert_response :success
  end

  test "should update spring_place" do
    patch :update, id: @spring_place, spring_place: { area_id: @spring_place.area_id, name: @spring_place.name, place: @spring_place.place, transportation: @spring_place.transportation }
    assert_redirected_to spring_place_path(assigns(:spring_place))
  end

  test "should destroy spring_place" do
    assert_difference('SpringPlace.count', -1) do
      delete :destroy, id: @spring_place
    end

    assert_redirected_to spring_places_path
  end
end
