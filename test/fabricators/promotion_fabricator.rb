# frozen_string_literal: true

Fabricator(:promotion) do
  name { sequence(:name) { |i| "Natal#{i}" } }
  description 'Promoção de natal'
  code { sequence(:code) { |i| "NATAL#{i}" } }
  discount_rate 15
  coupon_quantity 3
  expiration_date '22/12/2033'
  user
end
