# client mailer
class ClientMailer < ApplicationMailer
  default from: 'default@mail.com'

  def send_order(user, car)
    @user = user
    @car = car
    mail(to: @user.email, subject: 'text')
  end
end
