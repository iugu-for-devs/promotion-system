class Promotion < ApplicationRecord
  has_many :coupons, dependent: :restrict_with_error

  validates :name, :code, :discount_rate, :coupon_quantity,
            :expiration_date, presence: true
  validates :code, :name, uniqueness: true
  SEARCHABLE_FIELDS = %w[name code description].freeze

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

  def self.search(query)
    where(
      SEARCHABLE_FIELDS
        .map { |field| "#{field} LIKE :query" }
        .join(' OR '), 
      query: "%#{query}%")
    .limit(5)
  end
end
