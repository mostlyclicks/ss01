class SepSignupsController < ApplicationController
  # layout :false
  # GET /sep_signups
  # GET /sep_signups.json
  def index
    @sep_signups = SepSignup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sep_signups }
    end
  end

  # GET /sep_signups/1
  # GET /sep_signups/1.json
  def show
    @sep_signup = SepSignup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sep_signup }
    end
  end

  # GET /sep_signups/new
  # GET /sep_signups/new.json
  def new
    @sep_signup = SepSignup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sep_signup }
    end
  end

  # GET /sep_signups/1/edit
  def edit
    @sep_signup = SepSignup.find(params[:id])
  end

  # POST /sep_signups
  # POST /sep_signups.json
  def create
    @sep_signup = SepSignup.new(params[:sep_signup])

    respond_to do |format|
      if @sep_signup.save
        format.html { redirect_to @sep_signup, notice: 'Sep signup was successfully created.' }
        format.json { render json: @sep_signup, status: :created, location: @sep_signup }
      else
        format.html { render action: "new" }
        format.json { render json: @sep_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sep_signups/1
  # PUT /sep_signups/1.json
  def update
    @sep_signup = SepSignup.find(params[:id])

    respond_to do |format|
      if @sep_signup.update_attributes(params[:sep_signup])
        format.html { redirect_to @sep_signup, notice: 'Sep signup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sep_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sep_signups/1
  # DELETE /sep_signups/1.json
  def destroy
    @sep_signup = SepSignup.find(params[:id])
    @sep_signup.destroy

    respond_to do |format|
      format.html { redirect_to sep_signups_url }
      format.json { head :no_content }
    end
  end
end
