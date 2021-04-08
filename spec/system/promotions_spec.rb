require 'rails_helper'

describe 'Promotions test' do
  before do
    driven_by(:rack_test)
  end

  it 'view promotions' do
    # arrange
    user = User.create!(email: 'teste@iugu.com.br', password: '123456')
    Promotion.create!(name: 'Natal', description: 'Promoção de Natal',
                      code: 'NATAL10', discount_rate: 10, coupon_quantity: 100,
                      expiration_date: '22/12/2033', user: user)
    Promotion.create!(name: 'Cyber Monday', coupon_quantity: 100,
                      description: 'Promoção de Cyber Monday',
                      code: 'CYBER15', discount_rate: 15,
                      expiration_date: '22/12/2033', user: user)

    # act
    login_as user, scope: :user
    visit root_path
    click_on 'Promoções'

    # assert
    expect(page).to have_text('Natal')
    expect(page).to have_text('Promoção de Natal')
    expect(page).to have_text('10,00%')
  end

  it 'search promotions by term and finds one result' do
    user = User.create!(email: 'teste@iugu.com.br', password: '123456')
    christmas = Promotion.create!(name: 'Natal',
                                  description: 'Promoção de Natal',
                                  code: 'NATAL10', discount_rate: 10,
                                  coupon_quantity: 100,
                                  expiration_date: '22/12/2033', user: user)
    cyber_monday = Promotion.create!(name: 'Cyber Monday', coupon_quantity: 90,
                                     description: 'Promoção de Cyber Monday',
                                     code: 'CYBER15', discount_rate: 15,
                                     expiration_date: '22/12/2033', user: user)

    login_as user, scope: :user
    visit root_path
    click_on 'Promoções'
    fill_in 'Busca', with: 'natal'
    click_on 'Buscar'

    expect(page).to have_text(christmas.name)
    expect(page).not_to have_text(cyber_monday.name)
    expect(page).to have_text('1 promoção encontrada para o termo: natal')
  end
end