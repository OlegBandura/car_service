# client mailer
class ClientMailer < ApplicationMailer
  default from: 'default@mail.com'

  def send_order(user, garage, destroy, car, info, date)
    @user = user
    @date = date
    @info = info
    @garage = garage
    @car = car
    @destroy = destroy
    mail(to: @garage.garage_email, subject: 'Client email')
  end
end
