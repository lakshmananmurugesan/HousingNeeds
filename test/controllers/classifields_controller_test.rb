require 'test_helper'

class ClassifieldsControllerTest < ActionController::TestCase
  setup do
    @classifield = classifields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classifields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classifield" do
    assert_difference('Classifield.count') do
      post :create, classifield: { address: @classifield.address, latitude: @classifield.latitude, longitude: @classifield.longitude }
    end

    assert_redirected_to classifield_path(assigns(:classifield))
  end

  test "should show classifield" do
    get :show, id: @classifield
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classifield
    assert_response :success
  end

  test "should update classifield" do
    patch :update, id: @classifield, classifield: { address: @classifield.address, latitude: @classifield.latitude, longitude: @classifield.longitude }
    assert_redirected_to classifield_path(assigns(:classifield))
  end

  test "should destroy classifield" do
    assert_difference('Classifield.count', -1) do
      delete :destroy, id: @classifield
    end

    assert_redirected_to classifields_path
  end
end
