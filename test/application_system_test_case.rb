require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  Capybara.server = :puma, { Silent: true }

  # def take_failed_screenshot
  #   false
  # end
end
