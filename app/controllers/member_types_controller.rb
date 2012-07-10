class MemberTypesController < ApplicationController

  def index
    @member_types = MemberType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @member_types }
    end
  end

  def show
    @member_type = MemberType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member_type }
    end
  end

  def new
    @member_type = MemberType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member_type }
    end
  end

  def edit
    @member_type = MemberType.find(params[:id])
  end

  def create
    @member_type = MemberType.new(params[:member_type])

    respond_to do |format|
      if @member_type.save
        format.html { redirect_to @member_type, notice: 'member_type was successfully created.' }
        format.json { render json: @member_type, status: :created, location: @member_type }
      else
        format.html { render action: "new" }
        format.json { render json: @member_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @member_type = MemberType.find(params[:id])

    respond_to do |format|
      if @member_type.update_attributes(params[:member_type])
        format.html { redirect_to @member_type, notice: 'member_type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member_type = MemberType.find(params[:id])
    @member_type.destroy

    respond_to do |format|
      format.html { redirect_to member_types_url }
      format.json { head :no_content }
    end
  end

end
