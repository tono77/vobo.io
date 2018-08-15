class VoboMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.vobo_mailer.new_vobo.subject
  #
  def new_vobo
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
