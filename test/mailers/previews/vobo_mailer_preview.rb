# Preview all emails at http://localhost:3000/rails/mailers/vobo_mailer
class VoboMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/vobo_mailer/new_vobo
  def new_vobo
    VoboMailer.new_vobo
  end

end
