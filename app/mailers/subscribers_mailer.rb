class SubscribersMailer < ApplicationMailer
  def confirm(subscriber, author)
    @subscriber = subscriber
    @author = author
    mail subject: "Please confirm your subscription to #{author.name}", to: subscriber.email_address
  end
end
