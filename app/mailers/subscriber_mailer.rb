class SubscriberMailer < ApplicationMailer
  default from: 'no-reply@admi.com'

  def subscribed(subscriber)
    mail to: "#{subscriber.email}", subject: "Welcome to AdMi"
  end
end
