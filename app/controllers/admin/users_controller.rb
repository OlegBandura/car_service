module Admin
  # users controller
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      user = User.find(params[:id])
      if user.update(user_params)
        redirect_to admin_users_path
      else
        render action: 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:admin)
    end
  end
end
