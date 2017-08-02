class UserMailer < ApplicationMailer

  def order_confirmation(current_user, order)
    @current_user = current_user
    @order = order
    mail(to: @current_user.email, subject: "Confirmation Order# #{@order.id}")
  end

end
