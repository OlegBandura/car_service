# garage comments controller
class GarageCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @user_id = current_user.id
    @garage = Garage.find(params[:garage_id])
    @garage.garage_comments.create(comment_params)
    redirect_to garage_path(@garage)

    @user = User.find(current_user.id)
    puts "_______________"
    puts @user

  end

  private

  def comment_params
    params.require(:garage_comment).permit([:comment]).merge(
      user_id: current_user.id
    )
  end
end
