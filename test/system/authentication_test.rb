# frozen_string_literal: true

require 'application_system_test_case'

class AuthenticationTest < ApplicationSystemTestCase
  test 'user sign up' do
    visit root_path
    click_on 'Cadastrar'
    fill_in 'Email', with: 'jane.doe@iugu.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirmação de senha', with: 'password'
    within 'form' do
      click_on 'Cadastrar'
    end

    assert_text 'Boas vindas! Cadastrou e entrou com sucesso'
    assert_text 'jane.doe@iugu.com.br'
    assert_link 'Sair'
    assert_no_link 'Cadastrar'
    assert_current_path root_path
    # não logar e ir para o login?
    # confirmar a conta?
    # mandar email?
    # validar a qualidade da senha?
    # captcha não sou um robô
  end

  # test 'user sign up' do
  #   visit root_path
  #   click_on 'Cadastrar'
  #   within 'form' do
  #     click_on 'Cadastrar'
  #   end

  #   assert_text 'Senha não pode ficar em branco'
  #   assert_text 'Email não pode ficar em branco'
  # end

  test 'user sign in' do
    user = User.create!(email: 'jane.doe@iugu.com.br', password: 'password')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'

    assert_text 'Login efetuado com sucesso!'
    assert_text user.email
    assert_current_path root_path
    assert_link 'Sair'
    assert_no_link 'Entrar'
  end

  # TODO: Teste de sair
  # TODO: Teste de falha ao registrar
  # TODO: Teste de falha ao logar
  # TODO: Teste o recuperar senha
  # TODO: Teste o editar o usuário
  # TODO: I18n do user
  # TODO: incluir name no user
end
