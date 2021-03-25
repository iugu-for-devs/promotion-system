require 'application_system_test_case'

class CouponsTest < ApplicationSystemTestCase
  test 'disable a coupon' do
    promotion = Promotion.create!(name: 'Natal',
                                  description: 'Promoção de Natal',
                                  code: 'NATAL10', discount_rate: 10,
                                  coupon_quantity: 3,
                                  expiration_date: '22/12/2033')
    promotion.generate_coupons!

    login_user
    visit promotion_path(promotion)
    within 'div#coupon-natal10-0001' do
      click_on 'Desabilitar'
    end

    assert_text 'Cupom NATAL10-0001 desabilitado com sucesso'
    assert_text 'NATAL10-0001 (desabilitado)'
    within 'div#coupon-natal10-0001' do
      assert_no_link 'Desabilitar'
    end
    assert_link 'Desabilitar', count: promotion.coupon_quantity - 1
  end
end