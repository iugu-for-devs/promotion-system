require 'application_system_test_case'

class HomeTest < ApplicationSystemTestCase
  test 'visiting the index' do
    # AAA
    # Arrange
    # Act
    visit root_path

    # Assert
    assert_selector 'h1', text: 'Promotion System'
    assert_selector 'h3', text: 'Boas vindas ao sistema de gestão de promoções'
  end
end