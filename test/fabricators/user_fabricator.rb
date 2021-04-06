# frozen_string_literal: true

Fabricator(:user) do
  email { sequence(:email) { |i| "jane.doe#{i}@iugu.com.br" } }
  password '123456'
end
