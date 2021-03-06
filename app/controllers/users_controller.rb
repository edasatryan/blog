class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
  end

  def invite
    @user = User.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # create user
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Blog App!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  # Send invitation email
  def send_invitation
    begin
      @user = User.new(user_params)
      #
      if (@user.validate)
        respond_to do |format|
          InvitationMailer.invitation_email(@user).deliver
          flash[:success] = 'Invitation to User is successfully sent by email.'
          format.html { redirect_to '/' }
          format.json { render :show, status: :created, location: @user }

        end
      else
        render 'invite'
      end

    rescue
      flash[:danger] = 'An error exists during processing'
      redirect_to '/users/invite'
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # @user = params[:id].nil? ? User.new : User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :username)
  end
end
