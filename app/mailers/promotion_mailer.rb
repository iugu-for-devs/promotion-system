class PromotionMailer < ApplicationMailer
  def approval_email
    @promotion = params[:promotion]
    @approver = params[:approver]
    mail(to: @promotion.user.email,
         subject: "Sua promoção \"#{@promotion.name}\" foi aprovada")
  end
end
