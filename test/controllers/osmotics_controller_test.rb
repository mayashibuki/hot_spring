require 'test_helper'

class OsmoticsControllerTest < ActionController::TestCase
  setup do
    @osmotic = osmotics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:osmotics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create osmotic" do
    assert_difference('Osmotic.count') do
      post :create, osmotic: { name: @osmotic.name }
    end

    assert_redirected_to osmotic_path(assigns(:osmotic))
  end

  test "should show osmotic" do
    get :show, id: @osmotic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @osmotic
    assert_response :success
  end

  test "should update osmotic" do
    patch :update, id: @osmotic, osmotic: { name: @osmotic.name }
    assert_redirected_to osmotic_path(assigns(:osmotic))
  end

  test "should destroy osmotic" do
    assert_difference('Osmotic.count', -1) do
      delete :destroy, id: @osmotic
    end

    assert_redirected_to osmotics_path
  end
end
