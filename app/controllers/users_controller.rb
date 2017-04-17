class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_action :require_login, except: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
  end

  def invite
    @invitation = Invitation.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # create user
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to Blog App!'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  # Send invitation email
  def send_invitation
    begin
      @invitation = Invitation.new(invitation_params)
      if @invitation.valid?
        MailerProvider.invitation_email(@invitation).deliver
        flash[:success] = "An invitation to #{@invitation.name} has been sent successfully."
        redirect_to root_path
      else
        render 'invite'
      end
    rescue => e
      puts '###################################### ERROR MESSAGE ###'
      puts e.message
      puts '########################################################'
      flash[:danger] = 'An error occurred during processing'
      redirect_to users_invite_url
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # @user = User.find(params[:id])
  end

  def require_login
    return if logged_in?
    flash[:danger] = 'You must be logged in to access this section'
    redirect_to users_url # halts request cycle
    # unless logged_in?
    #   flash[:error] = "You must be logged in to access this section"
    #   redirect_to new_login_url # halts request cycle
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password,:password_confirmation, :username)
  end

  def invitation_params
    params.require(:invitation).permit(:name, :email)
  end
end
