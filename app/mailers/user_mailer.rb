class UserMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"

  def order_confirmation(order)
    @order = order
    mail(to: "#{order.email}", subject: 'Jungle Order #: #{order.id}' )
  end
end
