class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  # TODO(chase): this should probably be one action that changes the state
  #               of the item.
  #               also, probably shouldn't redirect, maybe just some ajax.

  def check_in
    @item = Item.find(params[:id])
    if @item.checkedout?
      if @item.update_attributes(checkedout: false, time_checked_in: Time.now,
                              checkedin: true, checked_out_by: '',
                              time_checked_out: nil)
          redirect_to @item, success: 'Item successfully checked in'
      else
        redirect_to @item, error: 'Item could not be checked in'
      end
    else
      redirect_to @item, error: 'Item is not checked out'
    end
  end

  def check_out
    @item = Item.find(params[:id])
    if @item.checkedin?
      if @item.update_attributes(checkedout: true, time_checked_in: '',
                              checkedin: false, checked_out_by: current_user,
                              time_checked_out: Time.now)
        redirect_to @item, success: 'Item successfully checked in'
      else
        redirect_to @item, error: 'Item could not be checked out'
      end
    else
      redirect_to @item, error: 'Item is not checked in'
    end
  end

  def go
    @item = Item.find_by_tag_number!(params[:tag_number])
    redirect_to @item
  end
end
