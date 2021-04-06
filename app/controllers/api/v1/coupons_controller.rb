# frozen_string_literal: true

class Api::V1::CouponsController < Api::V1::ApiController
  def show
    @coupon = Coupon.active.find_by!(code: params[:code])
    # render json: @coupon.as_json(methods: :discount_rate)
    # rescue ActiveRecord::RecordNotFound
    #   head 404
  end
end
