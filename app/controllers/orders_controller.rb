# orders controller
class OrdersController < ApplicationController

  def index
    @garage = Garage.find(params[:garage_id])
    @user_id = current_user.id
    @user_car = UserCar.user_car_property(@user_id)
    @year = Array[]
    Time.current.year.downto(1980) { |n| @year.push(n) }
  end

  def create
    date = Date.civil(
      params[:date][:year].to_i, params[:date][:month].to_i,
      params[:date][:day].to_i
    )
    time = "#{params[:order]['pickup_at(4i)']}:
      #{params[:order]['pickup_at(5i)']}"

    date = "#{date} at #{time}"
    user = current_user
    garage = Garage.find(params[:garage_id])
    destroy = order_params
    get_car = UserCar.get_selected_user_car(order_params[:user_car_id])
    user_car = Array[]
    get_car.each do |car|
      user_car = "#{car.brand_name} #{car.model} #{car.car_year}"
    end
    comment = order_params
    ClientMailer.send_order(
      user, garage, destroy, user_car, comment, date
    ).deliver
    flash[:success] = 'Your message sended'
    redirect_to garage_orders_url

  end

  private

  def order_params
    params.require(:order).permit(
      :user_car_id, :garage_id, :break_sub_category_id, :comment, :status,
      :times, :phone, :destroy
    )
  end

  def car_params
    params.require(:car).permit(:brand_id, :car_model_id, :car_year).merge(
      user_id: current_user.id
    )
  end
end
