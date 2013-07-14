require 'test_helper'

class ProductSamplesControllerTest < ActionController::TestCase
  setup do
    @product_sample = product_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_sample" do
    assert_difference('ProductSample.count') do
      post :create, product_sample: { category_id: @product_sample.category_id, description: @product_sample.description, price: @product_sample.price, size: @product_sample.size, title: @product_sample.title }
    end

    assert_redirected_to product_sample_path(assigns(:product_sample))
  end

  test "should show product_sample" do
    get :show, id: @product_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_sample
    assert_response :success
  end

  test "should update product_sample" do
    put :update, id: @product_sample, product_sample: { category_id: @product_sample.category_id, description: @product_sample.description, price: @product_sample.price, size: @product_sample.size, title: @product_sample.title }
    assert_redirected_to product_sample_path(assigns(:product_sample))
  end

  test "should destroy product_sample" do
    assert_difference('ProductSample.count', -1) do
      delete :destroy, id: @product_sample
    end

    assert_redirected_to product_samples_path
  end
end
