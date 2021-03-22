class Promotion < ApplicationRecord
  has_many :coupons

  validates :name, :code, :discount_rate, :coupon_quantity,
            :expiration_date, presence: { message: 'não pode ficar em branco' }
  validates :code, :name, uniqueness: { message: 'deve ser único' }

  def generate_coupons!
    return if coupons?

    (1..coupon_quantity).each do |number|
      coupons.create!(code: "#{code}-#{'%04d' % number}")
    end
  end

  # TODO: fazer testes pra esse método
  def coupons?
    coupons.any?
  end
end
