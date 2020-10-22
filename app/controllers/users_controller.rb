class UsersController < ApplicationController
    skip_before_action :authorized?, only: [:new, :create]

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:error] = "A wild error appeared"
          redirect_to new_user_path()
        end
    end
    
    
    

    private

    def user_params
        params.require(:user).permit(:username, :age, :email, :password, :bio, :favorite_pokemon, :favorite_type)
    end




end
