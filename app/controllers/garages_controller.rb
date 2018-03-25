# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @user = User.joins(:garage_comments).select('name, surname').where(
      'users.id = garage_comments.user_id and garage_id = ?', @garage.id
    )
  end
end
