require 'test_helper'

class ItemTransactionsControllerTest < ActionController::TestCase
  setup do
    @item_transaction = item_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_transaction" do
    assert_difference('ItemTransaction.count') do
      post :create, item_transaction: { item_checkin_time: @item_transaction.item_checkin_time, item_checkout_time: @item_transaction.item_checkout_time, item_creation_time: @item_transaction.item_creation_time, item_deletion_time: @item_transaction.item_deletion_time, item_id: @item_transaction.item_id, user_id: @item_transaction.user_id }
    end

    assert_redirected_to item_transaction_path(assigns(:item_transaction))
  end

  test "should show item_transaction" do
    get :show, id: @item_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_transaction
    assert_response :success
  end

  test "should update item_transaction" do
    put :update, id: @item_transaction, item_transaction: { item_checkin_time: @item_transaction.item_checkin_time, item_checkout_time: @item_transaction.item_checkout_time, item_creation_time: @item_transaction.item_creation_time, item_deletion_time: @item_transaction.item_deletion_time, item_id: @item_transaction.item_id, user_id: @item_transaction.user_id }
    assert_redirected_to item_transaction_path(assigns(:item_transaction))
  end

  test "should destroy item_transaction" do
    assert_difference('ItemTransaction.count', -1) do
      delete :destroy, id: @item_transaction
    end

    assert_redirected_to item_transactions_path
  end
end
