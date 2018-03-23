# garage comments controller
class GarageCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @user_id = current_user.id
    @garage = Garage.find(params[:garage_id])
    render plain: params[comment_params]
    # @garage.garage_comments.create(comment_params)
    # redirect_to service_path(@garage)
  end

  private

  def comment_params
    params.require(:garage_comment).permit(:comment).merge(
      user_id: current_user.id
    )
  end
end
