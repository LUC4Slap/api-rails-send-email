class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def login
    @user = User.by_login(user_params[:login])
    if @user.length == 1 && @user[0].password == user_params[:password]
      token = encode_token({user_id: @user[0].id, email: @user[0].email})
      render json: {user: @user[0], token: token}, status: :ok

    else
      render json: {error: "Usuario ou senha invalidos"}, status: :unprocessable_entity
    end
  end

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    exists = verify_user_exists()
    
    if exists.present?
      render json: {"error": "E-mail já cadastrado", "status": "401"}
    else
      @user = User.new(user_params) 
      if @user.save
        if @user.valid?
          token = encode_token({user_id: @user.id, email: @user.email})
        end
        UserMailer.welcome_email(@user).deliver_now
        render json: {user:  @user, token: token}, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :login, :password)
    end

    def verify_user_exists
      User.find_by_email(user_params[:email])
    end
end
