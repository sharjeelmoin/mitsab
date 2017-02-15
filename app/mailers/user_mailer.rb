class UserMailer < ApplicationMailer
	default from: "noreply@mitsab.com"

  def bid_notification_email(bid,email)
  	@bid = bid
  	@email = email
    mail(to: "inheritedarts@gmail.com", subject: 'Thank you for your bid')
  end

  def contact_email(name, city, state, email, phone)
        @name = name
        @city = city
        @state = email
        @email = email
        @phone = phone
        mail(to: "inheritedarts@gmail.com", subject: 'Contact Request')
  end

end
