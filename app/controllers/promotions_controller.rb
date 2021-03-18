class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to @promotion
    else
      render :new
    end
  end

  def generate_coupons
    @promotion = Promotion.find(params[:id])

    (1..@promotion.coupon_quantity).each do |number|
      Coupon.create!(code: "#{@promotion.code}-#{'%04d' % number}", promotion: @promotion)
    end

    flash[:notice] = 'Cupons gerados com sucesso'
    redirect_to @promotion
  end

  private

    def promotion_params
      params
        .require(:promotion)
        .permit(:name, :expiration_date, :description,
                :discount_rate, :code, :coupon_quantity)
    end
end