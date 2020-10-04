class GuestMailer < ApplicationMailer
  default from: 'thefreebails@gmail.com'

  def postponed_email(guest)
    @guest = guest
    mail(to: @guest.email, subject: 'A Message from Sarah and Jim')
  end
end
