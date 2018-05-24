# client mailer
class ClientMailer < ApplicationMailer
  default from: 'default@mail.com'

  def send_order(user, garage, destroy, car, comment, date)
    @user = user
    @date = date
    @comment = comment
    @garage = garage
    @car = car
    @destroy = destroy
    mail(to: @garage.garage_email, subject: 'Client email')
  end
end
