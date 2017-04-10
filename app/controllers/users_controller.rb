class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
skip_before_action :verify_authenticity_token
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def invite
    @user = User.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    begin
      @user = User.new(user_params)
      #
      respond_to do |format|
        InvitationMailer.invitation_email(@user).deliver
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }

      end
    rescue
      redirect_to '/users/invite'
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # @user = params[:id].nil? ? User.new : User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :username)
  end
end
