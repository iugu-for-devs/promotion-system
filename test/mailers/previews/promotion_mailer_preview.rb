class PromotionMailerPreview < ActionMailer::Preview
  def approval_email
    PromotionMailer
      .with(user: User.first, promotion: Promotion.first)
      .approval_email
  end
end
