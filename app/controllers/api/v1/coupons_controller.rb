class Api::V1::CouponsController < Api::V1::ApiController
  def show
    @coupon = Coupon.find_by(code: params[:code])
    render json: @coupon.as_json(except: [:promotion_id], include: [:promotion])
  end
end