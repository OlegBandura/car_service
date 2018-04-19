# client mailer
class ClientMailer < ApplicationMailer
  default from: 'default@mail.com'

  def send_order(user)
    @user = user
    mail(to: @user.email, subject: 'text')
  end
end
