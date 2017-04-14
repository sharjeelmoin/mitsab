class UserMailer < ApplicationMailer
	default from: "noreply@mitsab.com"

  def bid_notification_email(bid,email)
  	@bid = bid
  	@email = email
    mail(to: email, subject: 'Thank you for your bid')
  end

  def bid_notification_rejected(bid,email)
    @bid = bid
    @email = email
    mail(to: email, subject: 'Thank you for your bid')
  end

  def bid_notification_awarded(bid,email)
    @bid = bid
    @email = email
    mail(to: email, subject: 'Thank you for your bid')
  end

  def contact_email(name, email, phone, message)
        @name = name
        @email = email
        @phone = phone
        @message = message
        mail(to: "inheritedarts@gmail.com", subject: 'Contact Request')
  end

end
