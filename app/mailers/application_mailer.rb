# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@iugu.com.br'
  layout 'mailer'
end
