class ItemTransactionsController < ApplicationController
  # GET /item_transactions
  # GET /item_transactions.json
  def index
    @item_transactions = ItemTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_transactions }
    end
  end

  # GET /item_transactions/1
  # GET /item_transactions/1.json
  def show
    @item_transaction = ItemTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_transaction }
    end
  end

  # POST /item_transactions
  # POST /item_transactions.json
  def create
    @item_transaction = ItemTransaction.new(params[:item_transaction])
    @item_transaction.save
  end


end
